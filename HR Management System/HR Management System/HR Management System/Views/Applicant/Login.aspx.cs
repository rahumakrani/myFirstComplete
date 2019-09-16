using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Applicant_Login : System.Web.UI.Page
{
    Helper hc = new Helper();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["u_id"]!= null)
        {
            Response.Redirect("~/Views/Applicant/Profile.aspx");
        }

    }



    protected void btnLogIn_Click1(object sender, EventArgs e)
    {
        string count = hc.scalarReturn("select count(ap_id) from tbl_applicant_personal where ap_aadhar='" + txtAadhar.Text + "'");

        if (count.Equals("0"))
        {
            Label1.Text = txtAadhar.Text + " Account doesn't exists!!";
        }
        else
        {
            string pswfromDB = hc.scalarReturn("select ap_password from tbl_applicant_personal where ap_aadhar='" + txtAadhar.Text + "'");
            if (pswfromDB.Equals(txtpassword.Text))
            {
                //Login
                Session["u_id"]=hc.scalarReturn("select ap_id from tbl_applicant_personal where apq_aadhar='" + txtAadhar.Text + "'");
                HttpCookie cookie = new HttpCookie("UserDetails");
                cookie["Aadhar"] = Server.UrlEncode(txtAadhar.Text);
                cookie["Passwrod"] = Server.UrlEncode(txtpassword.Text);

                // Cookie will be persisted for 30 days
                cookie.Expires = DateTime.Now.AddDays(30);
                // Add the cookie to the client machine
                Response.Cookies.Add(cookie);
                Response.Redirect("~/Views/Applicant/Profile.aspx");
            }
            else
            {
                Label1.Text = ("Invelid Password");
            }
        }

    }
}