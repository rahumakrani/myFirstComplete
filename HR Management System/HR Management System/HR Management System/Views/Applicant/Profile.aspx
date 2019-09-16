<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Views_Applicant_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/CSS/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap-theme.css" rel="stylesheet" />
    <link href="../../Content/CSS/bootstrap-theme.min.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            width: 115px;
        }
        td{
            padding:10px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    
    
        <div class="row" style=" height:auto; min-height:1000px;">



            <div class="col-lg-4 col-md-4 col-sm-4">


                <asp:Image ID="Image1" runat="server"  ImageUrl="~/Content/img/building5.jpg" Style="margin-left:50px; margin-top:50px; height:350px; width:300px; margin-bottom:30px" />

               

                <div class="col-lg-8 col-md-8">
                    <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control"/>
                    </div>
                    <div class="col-lg-4 col-md-4">
                    <asp:Button ID="btnimageupload" runat="server" Text="Upload" class="btn btn-success" OnClick="Button2_Click" />
                        <asp:Label ID="Label8" runat="server" ForeColor="red" Text=""></asp:Label>
                    </div>
                   

                <table class="table table-responsive ">

                   <tr> <td class="auto-style1">Name :</td> <td>
                    <asp:Label ID="lblname" runat="server"></asp:Label></td> </tr>
                     
                    <tr> <td class="auto-style1">Aadhar :</td> <td>
                    <asp:Label ID="lblaadhar" runat="server"></asp:Label></td> </tr>
                     <tr> <td class="auto-style1">Phone :</td> <td>
                    <asp:Label ID="lblphone" runat="server"></asp:Label></td> </tr>
                    <tr> <td class="auto-style1">Phone 2 :</td> <td>
                    <asp:Label ID="lblphone2" runat="server"></asp:Label></td> </tr>
                     <tr> <td class="auto-style1">Email</td> <td>
                    <asp:Label ID="lblemail" runat="server"></asp:Label></td> </tr>
                     
                      <tr> <td class="auto-style1">Gender :</td> <td>
                    <asp:Label ID="lblgender" runat="server"></asp:Label></td> </tr>
                      <tr> <td class="auto-style1">Date of Birth :</td> <td>
                    <asp:Label ID="lbldob" runat="server"></asp:Label></td> </tr>
                     
 


                     


                     



                </table>




            </div>


            <div class="col-lg-8 col-md-8 col-sm-8" style=" height:auto;min-height:1000px ; border:1px solid black">
                <div class="row">
   <nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add Qualifications</asp:LinkButton></li>
    <li><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Update Records</asp:LinkButton></li>
      </ul>
        <ul class="nav navbar-nav navbar-right">
      <li> <asp:LinkButton ID="LinkButton3" runat="server" Style="float:right" OnClick="LinkButton3_Click">LogOut</asp:LinkButton> </li>
  </ul>

</nav>
                    </div>
                <asp:Panel ID="Panel1" runat="server">
                    <div class="row" style=" margin:0; padding:0PX">

                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="0">--select--</asp:ListItem>
                            <asp:ListItem Value="1">SSC</asp:ListItem>
                            <asp:ListItem Value="2">HSC</asp:ListItem>
                            <asp:ListItem Value="3">GRADUATION</asp:ListItem>
                            <asp:ListItem Value="4">MASTERS</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Panel ID="PSSC" runat="server">
                            <div class="row" style="border:1px solid gray"> 
                                <div class="container">
                                    <h1 style="text-align:center">SSC Records</h1>
                                    <table>
                                        <tr> <td> School Name: </td> <td> <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Percentage: </td> <td> <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> SSC  Mark sheet: </td> <td> <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" /> </td> </tr>
                                        <tr> <td > <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="btn btn-success" /></td> 
                                            <td > <asp:Button ID="Button7" runat="server" Text="Update" CssClass="btn btn-danger" /></td>

                                        </tr>

                                    </table>
                                </div>


                            </div>
                        </asp:Panel>


                        
                        <asp:Panel ID="PHSC" runat="server">
                            <div class="row" style="border:1px solid gray"> 
                                <div class="container">
                                    <h1 style="text-align:center">HSC Records</h1>
                                    <table>
                                        <tr> <td> College Name: </td> <td> <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Percentage: </td> <td> <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> HSC  Mark sheet: </td> <td> <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control" /> </td> </tr>
                                        <tr> <td colspan="2"> <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="btn btn-success" /></td></tr>

                                    </table>
                                </div>


                            </div>
                        </asp:Panel>


                        <asp:Panel ID="PGRAD" runat="server">
                            <div class="row" style="border:1px solid gray"> 
                                <div class="container">
                                    <h1 style="text-align:center">Graduation Records</h1>
                                    <table>
                                        <tr> <td> University Name: </td> <td> <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Percentage: </td> <td> <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Graduation Mark sheet: </td> <td> <asp:FileUpload ID="FileUpload4" runat="server" CssClass="form-control" /> </td> </tr>
                                        <tr> <td colspan="2"> <asp:Button ID="Button5" runat="server" Text="Submit" CssClass="btn btn-success" /></td></tr>

                                    </table>
                                </div>


                            </div>
                        </asp:Panel>

                         <asp:Panel ID="pmasters" runat="server">
                            <div class="row" style="border:1px solid gray"> 
                                <div class="container">
                                    <h1 style="text-align:center">Masters Records</h1>
                                    <table>
                                        <tr> <td> University Name: </td> <td> <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Percentage: </td> <td> <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox> </td> </tr>
                                        <tr> <td> Masters Mark sheet: </td> <td> <asp:FileUpload ID="FileUpload5" runat="server" CssClass="form-control" /> </td> </tr>
                                        <tr> <td colspan="2"> <asp:Button ID="Button6" runat="server" Text="Submit" CssClass="btn btn-success" /></td></tr>

                                    </table>
                                </div>


                            </div>
                        </asp:Panel>



                    </div>



                </asp:Panel>
                 <asp:Panel ID="Panel2" runat="server">

                     <div class="row" style=" height:700PX; margin:0; padding:0PX">


                           <table class="table table-responsive ">

                   <tr> <td class="auto-style1">Name :</td> <td>
                       <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                   
                   </td> </tr>
                     
                    <tr> <td class="auto-style1">Aadhar :</td> <td>
                     <asp:TextBox ID="txtaadhar" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox></td> </tr>
                     <tr> <td class="auto-style1">Phone :</td> <td>
                     <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control"></asp:TextBox>

                                                               </td> </tr>
                    <tr> <td class="auto-style1">Phone 2 :</td> <td>
                    <asp:TextBox ID="txtcontact2" runat="server" CssClass="form-control" ></asp:TextBox>

                                                                </td> </tr>
                     <tr> <td class="auto-style1">Email</td> <td>
                

                           <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                                                             </td> </tr>
                     
                     
                      <tr> <td class="auto-style1">Date of Birth :</td> <td>
                     <asp:TextBox ID="txtdob" runat="server" CssClass="form-control"></asp:TextBox></td> </tr>
                     
 
<tr>   <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn  btn-danger" OnClick="Button1_Click" />    </td>      </tr>
                               

                </table>






                    </div>





                </asp:Panel>







            </div>




    



    </div>
    </form>

    <script>
      

    </script>

</body>
</html>
