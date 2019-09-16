<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Views_Applicant_Register" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">





    <title>Sign Up</title>

    <link href="../../Content/CSS/bootstrap-theme.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/CSS/Site.css" rel="stylesheet" />

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
        body {
            margin: 0 auto;
            padding: 0px;
            background-image: url("../../Content/img/building5.jpg");
            background-repeat: no-repeat;
            background-size: 1960px 960px;
        }

        #wrapper {
        }

        #form {
            width: auto;
        }

        #pannelid {
            height: auto;
            margin: 0 auto;
        }

        #Calendar1 {
            display: none;
        }
    </style>


</head>
<body>

    <form id="form1" runat="server">

        <div id="wrapper" class="col-lg-12">

            <div id="center-form" style="width: 50%; height: auto; background-color: #00ffff; margin: 0 auto;">

                <div id="wholepannel" class="panel panel-primary col-md-12">
                    <div class="panel-heading" style="text-align: center; font-size: 125%">Registration Form</div>
                    <div class="panel-body" id="pannelid" style="margin: 0 auto;">

                        <div id="form">
                            <%--form code--%>

                            <legend>Personal Information</legend>

                            <div class="form-group">

                                <label for="usr">Aadhar No:</label>
                                <asp:TextBox ID="txtAadhar" runat="server" Class="form-control"></asp:TextBox>

                            </div>

                            <div class="form-group">
                                <label for="pwd">Date Of Birth</label>

                                <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>-
         <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>-
         <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>


                            </div>

                            <div class="form-group">
                                <label for="usr">Password</label>
                                <asp:TextBox ID="txtpassword" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>


                            </div>
                            <div class="form-group">
                                <label for="usr">Confirm Password</label>
                                <asp:TextBox ID="txtcpassword" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>


                                <p id="errorprint" style="color: red; font-weight: bold;"></p>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="usr">Name:</label>
                            <asp:TextBox ID="txtusername" runat="server" Class="form-control"></asp:TextBox>


                        </div>
                        <div class="form-group">
                            <label for="pwd">Contact:</label>
                            <asp:TextBox ID="txtcontact" runat="server" Class="form-control"></asp:TextBox>


                        </div>

                        <div class="form-group">
                            <label for="pwd">Contact 2:</label>
                            <asp:TextBox ID="txtcontact2" runat="server" Class="form-control"></asp:TextBox>


                        </div>

                        <div class="form-group">
                            <label for="pwd">Email ID:</label>
                            <asp:TextBox ID="txtemailid" runat="server" Class="form-control"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label for="pwd">Upload Image</label>
                            <asp:FileUpload ID="ImageUploadUser" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="pwd">Gender</label>

                            <asp:RadioButton ID="Male" GroupName="gender" runat="server" Checked="true" Text="Male" />
                            <asp:RadioButton ID="Female" GroupName="gender" runat="server" Text="Female" />

                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnNext" runat="server" Text="NEXT->" Class="btn btn-success" OnClick="Button1_Click" OnClientClick="return passwordmatchfunc()" />

                        </div>
                    </div>
                    <%--pannel content--%>
                </div>

                <%--form code--%>
            </div>

        </div>
        <%--wrapper end--%>
    </form>
</body>
</html>
