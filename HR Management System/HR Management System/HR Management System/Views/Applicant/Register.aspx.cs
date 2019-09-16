using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Applicant_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 1; i <= 12; i++)
        {

            DropDownList2.Items.Add(i.ToString());


        }

        for (int i = 1990; i < System.DateTime.Now.Year; i++)
        {
            DropDownList3.Items.Add(i.ToString());
        }

        //1,3,5,7,8,10,12

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {

            if (txtpassword.Text == txtcpassword.Text)
            {



                string msg = file_upload(ImageUploadUser);
                if (msg.Equals("-1"))
                {
                    Response.Write("<script>alert('some error with the mage!'); </script>");

                }
                else
                {
                    Applicant ap = new Applicant();

                    ap.ap_aadhar = txtAadhar.Text;
                    ap.ap_password = txtpassword.Text;
                    ap.ap_name = txtusername.Text;
                    ap.ap_phone1 = txtcontact.Text;
                    ap.ap_phone2 = txtcontact2.Text;
                    ap.ap_email = txtemailid.Text;
                    ap.ap_image = msg;

                    ap.ap_dob = new DateTime();
                    ap.ap_dob= Convert.ToDateTime(DropDownList1.SelectedItem.ToString() + "-" + DropDownList2.SelectedItem.ToString() + "-" + DropDownList3.SelectedItem.ToString());
                    if (Male.Checked == true)
                    {
                        ap.ap_gender = 1;
                    }
                    else
                    {
                        ap.ap_gender = 0;

                    }

                    ApplicantLogicLayer apl = new ApplicantLogicLayer();
                    string msg2 = apl.insert(ap);

                    if (msg2.Equals("1"))
                    {
                        Response.Write("<script>alert('Data successfully added!'); </script>");
                        Response.Redirect("~/Views/Applicant/Login.aspx");

                    }
                    else
                    {
                        Response.Write("<script>alert('data could not successfully uploaded...plz try again '); </script> ");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Password Mismatch');</script>");
            }

        }



    } // Event end here
    public string file_upload(FileUpload fileUpload)
    {
        string msg = "-1";
        if (fileUpload.HasFile)
        {
            string fileExtention = Path.GetExtension(fileUpload.FileName);

            if (fileExtention.ToLower() != ".png" && fileExtention.ToLower() != ".jpg")
            {
                Response.Write("<script>alert('Only image are allowed to upload, Kindly use PNG or JPG formate'); </script>");
            }
            else
            {
                int fileSize = fileUpload.PostedFile.ContentLength;

                if (fileSize > 2097152)  // can't upload > 2MB image!
                {
                    Response.Write("<script>alert('Only less then 2 MB size allowed to upload!!'); </script>");
                }
                else
                {
                    Random r = new Random();
                    int r1 = r.Next();
                    int r2 = r.Next();
                    msg = "~/Content/Uploads/" + r1 + r2 + fileUpload.FileName;
                    fileUpload.SaveAs(Server.MapPath(msg));
                }
            }
        }
        else
        {
            Response.Write("<script>alert('Please select a file'); </script>");

        }
        return msg;
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.ToString().Equals("1") || DropDownList2.SelectedItem.ToString().Equals("3") || DropDownList2.SelectedItem.ToString().Equals("5") || DropDownList2.SelectedItem.ToString().Equals("7") || DropDownList2.SelectedItem.ToString().Equals("8") || DropDownList2.SelectedItem.ToString().Equals("10") || DropDownList2.SelectedItem.ToString().Equals("12"))
        {
            for (int i = 1; i <= 31; i++)
            {
                DropDownList1.Items.Add(i.ToString());
            }
            
        }
        else if (DropDownList2.SelectedItem.ToString().Equals("2"))
        {
            int year = Convert.ToInt32(DropDownList3.SelectedItem.ToString());
            if (year % 4 == 0)
            {
                for (int i = 1; i < 29; i++)
                {
                    DropDownList1.Items.Add(i.ToString());
                }
            }
            else
            {
                for (int i = 1; i < 29; i++)
                {
                    DropDownList1.Items.Add(i.ToString());
                }
            }
        }
        else
        {

            for (int i = 1; i <= 30; i++)
            {
                DropDownList1.Items.Add(i.ToString());
            }

        }
    }
}