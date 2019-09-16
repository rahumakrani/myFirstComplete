using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Applicant_Profile : System.Web.UI.Page
{
    private string connstring = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        Button7.Visible = false;
        pmasters.Visible = false;
        PSSC.Visible = false;
        PHSC.Visible = false;
        PGRAD.Visible = false;
        Panel2.Visible = false;

        HttpCookie cookie = Request.Cookies["UserDetails"];
        if (cookie != null)
        {

            if (Server.UrlDecode(cookie["Passwrod"]) != null)
            {
                Helper hc = new Helper();
                Session["u_id"] = hc.scalarReturn("Select ap_id from tbl_applicant_personal where ap_aadhar =  ltrim(rtrim('" + Server.UrlDecode(cookie["aadhar"]) + "'))");

                string q= "select ap_image,ap_name,ap_aadhar,ap_phone1,ap_phone2,ap_email,ap_gender,ap_dob from tbl_applicant_personal where ap_id=" + Session["u_id"];
                SqlConnection conn = new SqlConnection(connstring);

                try
                {
                    SqlCommand cmd = new SqlCommand(q,conn);
                    conn.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        lblname.Text = sdr.GetValue(1).ToString();
                        lblaadhar.Text = sdr.GetValue(2).ToString();
                        lblphone.Text = sdr.GetValue(3).ToString();
                        lblphone2.Text = sdr.GetValue(4).ToString();
                        lblemail.Text = sdr.GetValue(5).ToString();

                        if (sdr.GetValue(6).ToString().Equals("1"))
                        {
                            lblgender.Text = "Male";
                        }
                        else
                        {
                            lblgender.Text = "Female";
                        }

                        lbldob.Text = sdr.GetValue(7).ToString();
                        Image1.ImageUrl = sdr.GetValue(0).ToString();
                    }
                    conn.Close();

                }
                catch (Exception)
                {
                    Response.Redirect("~/Views/Applicant/login.aspx");
                   // throw;
                }

            }
        }
        else
        {
            Response.Redirect("~/Views/Applicant/login.aspx");
        }
        if (Session["u_id"] == null)
        {

            Response.Redirect("~/Views/Applicant/login.aspx");
        }



    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string s = file_upload(FileUpload1);
        if (s.Equals("-1"))
        {
            Label8.Text = "Image could not be uploaded....";
        }
        else
        {
            ApplicantLogicLayer ap = new ApplicantLogicLayer();
            ap.UpdateImage(Convert.ToInt32(Session["u_id"]), s);
            Response.Redirect("~/Views/Applicant/profile.aspx");
        }

    }
    public string file_upload(FileUpload fileupload)
    {
        string msg = "-1";

        if (fileupload.HasFile)
        {

            string fileextenion = Path.GetExtension(fileupload.FileName);

            if (fileextenion.ToLower() != ".png" && fileextenion.ToLower() != ".jpg")
            {
                Response.Write("<script>alert('Only images are allowed to upload , please select jpg or png image.... '); </script> ");
            }
            else
            {
                int filesize = fileupload.PostedFile.ContentLength;

                if (filesize > 2097152) //cannot upload > 2 mb image......
                {
                    Response.Write("<script>alert('Only images are allowed to upload that are size of less than 2 MB  '); </script> ");
                }
                else
                {
                    Random r = new Random();
                    int r1 = r.Next();
                    int r2 = r.Next();
                    msg = "~/Content/Uploads/" + r1 + r2 + fileupload.FileName;
                    fileupload.SaveAs(Server.MapPath(msg));
                }



            }




        }
        else
        {
            Response.Write("<script>alert('please select a file '); </script> ");

        }

        return msg;


    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //add qualification.....
        Panel1.Visible = true;
        Panel2.Visible = false;

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;

        string q = "select ap_image,ap_name,ap_phone1,ap_phone2,ap_email,ap_gender,ap_dob,ap_aadhar from tbl_applicant_personal where ap_id=" + Session["u_id"];
        SqlConnection conn = new SqlConnection(connstring);

        try
        {
            SqlCommand cmd = new SqlCommand(q, conn);
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                txtname.Text = rdr.GetValue(1).ToString();
                txtaadhar.Text = rdr.GetValue(7).ToString();
                //lblaadhar.Text = rdr.GetValue(7).ToString();

                txtcontact.Text = rdr.GetValue(2).ToString();

                txtcontact2.Text = rdr.GetValue(3).ToString();
                txtemail.Text = rdr.GetValue(4).ToString();


                txtdob.Text = rdr.GetValue(6).ToString();



            }

        }
        catch (Exception)
        {
       
        }





        //update records 

    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        HttpCookie cookie = Request.Cookies["UserDetails"];
        cookie.Expires = DateTime.Now.AddDays(-1d);
        Response.Cookies.Add(cookie);
        Response.Cookies["userId"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("~/Views/Applicant/login.aspx");

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Applicant ap = new Applicant();
        ap.ap_name = txtname.Text;
        ap.ap_email = txtemail.Text;
        ap.ap_phone1 = txtcontact.Text;
        ap.ap_phone2 = txtcontact2.Text;
        ap.ap_dob = Convert.ToDateTime(txtdob.Text);
        ap.ap_id = Convert.ToInt32(Session["u_id"].ToString());
        ApplicantLogicLayer logic = new ApplicantLogicLayer();
        logic.Update(ap);
        Response.Redirect("~/Views/Applicant/profile.aspx");
    }
}