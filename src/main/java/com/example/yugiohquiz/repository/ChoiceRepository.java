package com.example.yugiohquiz.repository;

import com.example.yugiohquiz.model.Choice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChoiceRepository extends JpaRepository<Choice, Long> {
}
