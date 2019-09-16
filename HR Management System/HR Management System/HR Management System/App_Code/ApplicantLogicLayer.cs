using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class ApplicantLogicLayer
{
    private string connString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

    public string insert(Applicant ap)
    {
        string msg = "-1";
        SqlConnection conn = new SqlConnection(connString);

        try
        {
            SqlCommand cmd = new SqlCommand("sp_applicant_personal_new", conn);
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ap_name", SqlDbType.NVarChar, 25).Value = ap.ap_name;
            cmd.Parameters.Add("@ap_aadhar", SqlDbType.NVarChar, 25).Value = ap.ap_aadhar;

            cmd.Parameters.Add("@ap_email", SqlDbType.NVarChar, 25).Value = ap.ap_email;
            cmd.Parameters.Add("@ap_phone1", SqlDbType.NVarChar, 25).Value = ap.ap_phone1;
            cmd.Parameters.Add("@ap_phone2", SqlDbType.NVarChar, 25).Value = ap.ap_phone2;
            cmd.Parameters.Add("@ap_image", SqlDbType.NVarChar).Value = ap.ap_image;
            cmd.Parameters.Add("@ap_gender", SqlDbType.Int).Value = ap.ap_gender;
            cmd.Parameters.Add("@ap_dob", SqlDbType.Date).Value = ap.ap_dob;
            cmd.Parameters.Add("@ap_password", SqlDbType.NVarChar, 25).Value = ap.ap_password;

            cmd.ExecuteNonQuery();
            msg = "1";
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            conn.Close();
        }
        
        return msg;
    }

    public string Update(Applicant ap)
    {
        string msg = "-1";
        SqlConnection con = new SqlConnection(connString);

        try
        {
            SqlCommand cmd = new SqlCommand("sp_personalDetails", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ap_name", SqlDbType.NVarChar, 100).Value = ap.ap_name;
            cmd.Parameters.Add("@ap_phone1", SqlDbType.NVarChar, 30).Value = ap.ap_phone1;
            cmd.Parameters.Add("@ap_phone2", SqlDbType.NVarChar, 30).Value = ap.ap_phone2;
            cmd.Parameters.Add("@ap_email", SqlDbType.NVarChar, 30).Value = ap.ap_email;
            cmd.Parameters.Add("@ap_dob", SqlDbType.Date).Value = ap.ap_dob;
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = ap.ap_id;

            cmd.ExecuteNonQuery();
            msg = "1";

        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            con.Close();

        }

        return msg;






    } //method end/////////

    public string UpdateImage(int id, string path)
    {
        string msg = "-1";
        SqlConnection con = new SqlConnection(connString);

        try
        {
            SqlCommand cmd = new SqlCommand("#", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ap_image", SqlDbType.NVarChar).Value = path;

            cmd.Parameters.Add("@ap_id", SqlDbType.Int).Value = id;

            cmd.ExecuteNonQuery();
            msg = "1";

        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            con.Close();

        }

        return msg;
    }

}