package com.example.yugiohquiz.service;

import com.example.yugiohquiz.model.Question;
import com.example.yugiohquiz.repository.QuestionRepository;
import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.List;

@Service
public class QuizService {
    private final QuestionRepository questionRepository;
    public QuizService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public List<Question> getRandomQuestions(int n) {
        List<Question> all = questionRepository.findAll();
        Collections.shuffle(all);
        return all.size() <= n ? all : all.subList(0, n);
    }
}
