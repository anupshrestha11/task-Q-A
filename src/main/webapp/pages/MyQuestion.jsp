<%@ page language="java" contentType="text/html; charset-UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="sessionChecker.jsp" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h3>${userFullName}</h3>
    <a href="/logout">
        <button class="btn btn-danger" style="float: right">Logout</button>
    </a>
    <div class="row">
        <div class="col-md-6"><h4><b><a href="/dashboard">Questions Pool</a></b></h4>
            <h4><b><a href="/myQuestion">My Question</a></b></h4>
            <br>
            <a href="/askQuestion">
                <button class="btn btn-primary" style="margin: 5px">Ask Question</button>
            </a>

            <table class="table">
                <thead>
                <tr>
                    <th>S.n.</th>
                    <th>Question</th>
                    <th>View Answers</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${myQuestions}" var="question" varStatus="i">
                    <tr>
                        <td><c:out value="${i.index+1}"></c:out></td>
                        <td><c:out value="${question.question}"></c:out></td>
                        <td><a href="/viewQuestion/<c:out value="${question.id}"></c:out>" class="btn btn-primary">View
                            Answer</a></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
</div>
</body>
</html>