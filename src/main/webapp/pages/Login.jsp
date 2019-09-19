<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
    <style>
        .btnLogin{
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #0062cc;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }
        input{
            border: none;
            border-radius: 1.5rem;
            width: 60%;
            background: #f8f9fa;
            font-weight: bold;
            color: #383d41;
            cursor: pointer;
        }
        button{
            float: right;
            border: none;
            border-radius: 1.5rem;
            background: #00c6ff;
            font-weight: bold;
            color: #383d41;
            cursor: pointer;
            padding: 5px 15px;
        }
        hr {
            border: #495057 1px solid;
            border-radius: 10px;
        }

        body {
            background: url(http://mymaplist.com/img/parallax/back.png);
            background-color: #444;
            background: url(http://mymaplist.com/img/parallax/pinlayer2.png), url(http://mymaplist.com/img/parallax/pinlayer1.png), url(http://mymaplist.com/img/parallax/back.png);
        }

        .vertical-offset-100 {
            padding-top: 300px;
        }
    </style>

</head>
<body style="background: -webkit-linear-gradient(left, #3931af, #00c6ff)">
<div class="container">
    <div class="row vertical-offset-100">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please sign in</h3>
                </div>
                <div class="panel-body">
                    <form accept-charset="UTF-8" role="form" action="login" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="UserName" name="userName" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password"
                                       value="">
                            </div>
                            <input class="btn btn-lg btnLogin btn-block" type="submit" value="Login">
                        </fieldset>
                    </form>
                    <hr>
                    Don't have an Accouut?
                    <a href="register">
                    <Button>Register</Button>
                </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(document).mousemove(function (e) {
            TweenLite.to($('body'),
                .5,
                {
                    css:
                        {
                            backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px"
                        }
                });
        });
    });
</script>
</body>
</html>