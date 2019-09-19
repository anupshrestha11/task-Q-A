package com.unlimit.task.repository;

import com.unlimit.task.models.Question;
import com.unlimit.task.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

    List<Question> findByUserId(int userId);
}
