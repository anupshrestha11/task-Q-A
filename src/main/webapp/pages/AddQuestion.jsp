<%@ page language="java" contentType="text/html; charset-UTF-8" %>
<%@ include file="sessionChecker.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ask Question</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h3>${userFullName}</h3>
    <a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    <a href="/logout">
        <button class="btn btn-danger" style="float: right">Logout</button>
    </a>
    <div class="row">
        <div class="col-md-6"><h4><b>Ask Question</b></h4><br>
            <form action="/askQuestion" method="post">
                <div class="form-group">
                    <label for="question">Question : </label>
                    <input type="text" class="form-control" placeholder="Enter Question" name="question" id="question">
                </div>
                <div class="form-group">

                    <input type="submit" class="btn btn-outline-success" value="Submit">

                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>