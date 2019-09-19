package com.unlimit.task.controller;

import com.unlimit.task.models.Answer;
import com.unlimit.task.models.Question;
import com.unlimit.task.models.User;
import com.unlimit.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes(names = {"userId", "userFullName", "questions"})
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String getRegistration() {
        return "Register";
    }

    @GetMapping("/register")
    public String getRegistrationpage() {
        return "Register";
    }

    @PostMapping("/register/{roleId}")
    public String registerUser(@ModelAttribute User user, @PathVariable("roleId") int roleId) {
        userService.saveUser(user, roleId);
        return "Register";
    }

    @GetMapping("/login")
    public String getLogin() {
        return "Login";
    }

    @GetMapping("/logout")
    public String getLogout(SessionStatus status) {
        status.setComplete();
        return getLogin();
    }

    @PostMapping("/login")
    public ModelAndView getLoggedin(@RequestParam("userName") String userName, @RequestParam("password") String password, ModelMap model) {
        User user = userService.checkUser(userName, password);
        ModelAndView mv = new ModelAndView();
        if (user == null) {
            mv.setViewName("Login");
            return mv;
        } else {
            model.addAttribute("userFullName", user.getFirstName() + " " + user.getLastName());
            model.addAttribute("userId", user.getId());
            model.addAttribute("questions", userService.getAllQuestion());
            mv.setViewName("Dashboard");
            return mv;
        }
    }

    @GetMapping("/askQuestion")
    public String gotoQuestionForm() {
        return "AddQuestion";
    }

    @PostMapping("askQuestion")
    public String addQuestion(@RequestParam("question") String question, ModelMap model) {
        Question question1 = new Question();
        question1.setQuestion(question);
        int userId = Integer.parseInt(model.get("userId").toString());
        userService.addQuestion(question1, userId);
        Recall(model);
        return "Dashboard";
    }

    @GetMapping("/viewQuestion/{questionId}")
    public ModelAndView viewQuestion(@PathVariable("questionId") int questionId) {
        Question question = userService.getQuestion(questionId);
        ModelAndView mv = new ModelAndView();
        mv.addObject("question", question);
        mv.addObject("answers", question.getAnswers());
        mv.setViewName("ViewQuestion");
        return mv;
    }

    @PostMapping("/submitAnswer/{questionId}")
    public ModelAndView submitAnswer(@PathVariable("questionId") int questionId, @RequestParam("answer") String answer, ModelMap model) {
        Answer answer1 = new Answer(answer);
        int userId = Integer.parseInt(model.get("userId").toString());
        userService.saveAnswer(answer1, questionId, userId);
        return viewQuestion(questionId);
    }

    @GetMapping("/dashboard")
    public String viewDashBoard(ModelMap model) {
        Recall(model);
        return "Dashboard";
    }

    @GetMapping("/myQuestion")
    public String viewMyQuestion(ModelMap model) {
        Recall(model);
        return "MyQuestion";
    }

    public void Recall(ModelMap model) {
        model.addAttribute("questions", userService.getAllQuestion());
        model.addAttribute("myQuestions", userService.getQuestions(Integer.parseInt(model.get("userId").toString())));
    }

}
