package com.example.yugiohquiz.controller;

import com.example.yugiohquiz.model.Choice;
import com.example.yugiohquiz.model.Question;
import com.example.yugiohquiz.model.Result;
import com.example.yugiohquiz.repository.ChoiceRepository;
import com.example.yugiohquiz.repository.QuestionRepository;
import com.example.yugiohquiz.repository.ResultRepository;
import com.example.yugiohquiz.service.QuizService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class QuizController {
    private final QuizService quizService;
    private final QuestionRepository questionRepository;
    private final ChoiceRepository choiceRepository;
    private final ResultRepository resultRepository;

    public QuizController(QuizService quizService, QuestionRepository questionRepository, ChoiceRepository choiceRepository, ResultRepository resultRepository) {
        this.quizService = quizService;
        this.questionRepository = questionRepository;
        this.choiceRepository = choiceRepository;
        this.resultRepository = resultRepository;
    }

    @GetMapping({"/", "/index"})
    public String index() {
        return "index";
    }

    @GetMapping("/quiz")
    public String quiz(Model model, @RequestParam(defaultValue = "5") int size) {
        List<Question> questions = quizService.getRandomQuestions(size);
        model.addAttribute("questions", questions);
        return "quiz";
    }

    @PostMapping("/submit")
    public String submit(@RequestParam Map<String, String> params, Model model, @RequestParam(defaultValue = "Player") String playerName) {
        int score = 0;
        List<Map<String,Object>> feedback = new ArrayList<>();
        for (String key : params.keySet()) {
            if (!key.startsWith("q_")) continue;
            try {
                Long qid = Long.parseLong(key.substring(2));
                Long cid = Long.parseLong(params.get(key));
                Optional<Question> qopt = questionRepository.findById(qid);
                Optional<Choice> copt = choiceRepository.findById(cid);
                if (qopt.isPresent() && copt.isPresent()) {
                    Choice choice = copt.get();
                    boolean correct = choice.isCorrect();
                    if (correct) score++;
                    Map<String,Object> fb = new HashMap<>();
                    fb.put("question", qopt.get());
                    fb.put("chosen", choice);
                    fb.put("correct", correct);
                    qopt.get().getChoices().stream().filter(Choice::isCorrect).findFirst().ifPresent(c -> fb.put("correctChoice", c));
                    feedback.add(fb);
                }
            } catch (Exception e) {
                // ignore parse errors
            }
        }
        Result result = new Result();
        result.setPlayerName(playerName);
        result.setScore(score);
        resultRepository.save(result);

        model.addAttribute("score", score);
        model.addAttribute("feedback", feedback);
        model.addAttribute("player", playerName);
        return "result";
    }
}
