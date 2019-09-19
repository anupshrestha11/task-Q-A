package com.unlimit.task.service;

import com.unlimit.task.models.Answer;
import com.unlimit.task.models.Question;
import com.unlimit.task.models.User;
import com.unlimit.task.repository.AnswerRepository;
import com.unlimit.task.repository.QuestionRepository;
import com.unlimit.task.repository.RoleRepository;
import com.unlimit.task.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    UserRepository userRepo;

    @Autowired
    RoleRepository roleRepo;

    @Autowired
    QuestionRepository questionRepo;

    @Autowired
    AnswerRepository ansRepo;

    @Autowired
    NotificationService notificationService;

    public String saveUser(User user,int roleId) {
        System.out.println(user.toString());
        if (getUser(user.getEmail(), user.getUserName()).isEmpty()) {
            user.setRole(roleRepo.getOne(roleId));
            userRepo.save(user);
            return "inserted Successfully";
        }
        return "Email or Username already Exist";

    }

    public List<User> getUser(String email, String userName) {
        return userRepo.findByEmailOrUserName(email, userName);
    }

    public User checkUser(String userName, String password) {
        return userRepo.getByEmailOrUserNameAndPassword(userName, userName, password);
    }

    public void addQuestion(Question question, int userId){
        question.setUser(userRepo.getOne(userId));
        questionRepo.save(question);
    }

    public List<Question> getQuestions(int userId){
        return questionRepo.findByUserId(userId);
    }

    public List<Question> getAllQuestion(){
        return questionRepo.findAll();
    }

    public Question getQuestion(int questionId){
        return questionRepo.getOne(questionId);
    }

    public void saveAnswer(Answer answer,int questionId, int userId){
        answer.setUser(userRepo.getOne(userId));
        answer.setQuestion(questionRepo.getOne(questionId));
        ansRepo.save(answer);
        try {
            Question question = questionRepo.getOne(questionId);
            notificationService.sendNotification(question.getUser().getEmail(),question.getQuestion());
        }
        catch (MailException e){
            e.printStackTrace();
        }
    }
}
