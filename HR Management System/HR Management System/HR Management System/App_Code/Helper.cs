using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public class Helper
{
    //File upload code
    //public string file_upload(FileUpload fileUpload, string id)
    //{
    //    string msg = "-1";
    //    if (fileUpload.HasFile)
    //    {
    //        string fileExtention = Path.GetExtension(fileUpload.FileName);

    //        if (fileExtention.ToLower() != ".png" && fileExtention.ToLower() != ".jpg")
    //        {
    //            Response.Write("<script>alert('Only image are allowed to upload, Kindly use PNG or JPG formate'); </script>");
    //        }
    //        else
    //        {
    //            int fileSize = fileUpload.PostedFile.ContentLength;
    //            if (fileSize > 2097152)  // can't upload > 2MB image!
    //            {
    //                Response.Write("<script>alert('Only less then 2 MB size allowed to upload!!'); </script>");
    //            }
    //            else
    //            {
    //                msg = "~/Uploads/" + id + fileUpload.FileName;
    //                fileUpload.SaveAs(Server.MapPath(msg));
    //            }
    //        }
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('Please select a file'); </script>");

    //    }
    //    return msg;
    //}

    private string connstring = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
    public string scalarReturn(string q)
    {
        string s;
        SqlConnection conn = new SqlConnection(connstring);
        conn.Open();
        try
        {
            SqlCommand cmd = new SqlCommand(q, conn);
            s = cmd.ExecuteScalar().ToString();

        }
        catch (Exception)
        {
            s = "-1";
            //
        }
        return s;

    }

}