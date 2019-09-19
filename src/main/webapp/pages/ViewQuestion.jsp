<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="sessionChecker.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Question</title>
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
        <div class="col-md-6"><h2>Question: ${question.question}</h2><br>Asked by: ${question.user.userName}
            <br>
            <hr>
            <c:forEach items="${answers}" var="answer" varStatus="i">
                Answer: <br>
                <p>${answer.answer}</p>
                <br>
                Replied by: ${answer.user.userName} (${answer.user.role.role})
                <br>
                <hr>
            </c:forEach>
            <form action="/submitAnswer/${question.id}" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" height="50px" name="answer" placeholder="Your Answer">
                </div>
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</div>
</body>
</html>