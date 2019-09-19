package com.unlimit.task.repository;

import com.unlimit.task.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    List<User> findByEmailOrUserName(String Email, String UserName);

    User getByEmailOrUserNameAndPassword(String Email, String UserName, String password);
}
