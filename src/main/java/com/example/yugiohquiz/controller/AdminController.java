package com.example.yugiohquiz.controller;

import com.example.yugiohquiz.model.Choice;
import com.example.yugiohquiz.model.Question;
import com.example.yugiohquiz.repository.QuestionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final QuestionRepository questionRepository;
    public AdminController(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("questions", questionRepository.findAll());
        return "admin/list";
    }

    @GetMapping("/new")
    public String form(Model model) {
        model.addAttribute("question", new Question());
        return "admin/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Question question, @RequestParam(required=false) String[] choiceTexts, @RequestParam(required=false) Integer[] correctIndex) {
        if (choiceTexts != null) {
            question.setChoices(new java.util.ArrayList<>());
            for (int i = 0; i < choiceTexts.length; i++) {
                Choice c = new Choice();
                final int currentIndex = i;
                c.setText(choiceTexts[i]);
                c.setCorrect(correctIndex != null && java.util.Arrays.stream(correctIndex).anyMatch(idx -> idx == currentIndex));
                c.setQuestion(question);
                question.getChoices().add(c);
            }
        }
        questionRepository.save(question);
        return "redirect:/admin";
    }
}
