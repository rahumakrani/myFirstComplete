<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Views_Applicant_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <!--include jQuery Validation Plugin-->
    <script src="../../Content/JS/bootstrap.js"></script>
    <script src="../../Content/JS/bootstrap.min.js"></script>
    <script src="../../Content/JS/jquery-3.3.1.intellisense.js"></script>
    <script src="../../Content/JS/jquery-3.3.1.js"></script>
    <script src="../../Content/JS/jquery-3.3.1.min.js"></script>
    <script src="../../Content/JS/jquery-3.3.1.slim.js"></script>
    <script src="../../Content/JS/jquery-3.3.1.slim.min.js"></script>
    <script src="../../Content/JS/modernizr-2.8.3.js"></script>

    <style>
        #box {
            border: 1px solid black;
            height: 100%;
        }

        #main-div {
            height: 620px;
            background-image: url("../../Content/img/building.jpg");
            background-size: 100% 1000px;
        }


        .insidebox {
            border: 1px solid black;
            margin: 10% auto 10% auto;
            max-width: 500px;
            min-width: 200px;
            padding-left: 60px;
            padding-right: 60px;
            border-radius: 10px;
            background-color: ivory;
        }

        div h1 {
            text-align: center;
        }

        p#para {
            text-align: center;
            font-size: 14px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div id="main-div">
            <div id="box" class="img-responsive">

                <div class="insidebox">
                    <div>
                        <h1>Login</h1>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                            <asp:TextBox ID="txtAadhar" runat="server" class="form-control" placeholder="Aadhar NO:" required="required"></asp:TextBox>

                        </div>
                       

                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                            <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Password" TextMode="Password" required="required"></asp:TextBox>

                        </div>

                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnLogIn" runat="server" Text="Log In" class="form-control  btn-success" OnClick="btnLogIn_Click1" OnClientClick="retrun(passwordmatchfunc())"/>

                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                                <p id="para">Dont have an account? <a href="Register.aspx">register now</a> </p>

                </div>
            </div>


        </div>
    </form>
     <script>
    //my function()
    function passwordmatchfunc()
    {
        var ret = true;
        var x = document.getElementById("txtpassword").value;
        var y = document.getElementById("txtcpassword").value;

        
        if (x !== y)
        {
            alert('Password Mismatch');
            //document.getElementById("errorprint").innerHTML = "Password mismatch!";
             ret = false;
        }

        return ret;

    } //my function() 

        </script>

</body>
</html>
