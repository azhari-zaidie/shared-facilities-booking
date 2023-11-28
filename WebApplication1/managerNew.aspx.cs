using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class managerNew : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            Image2.ImageUrl = Convert.ToString(Session["image"]);
            lblSuccess.Visible = false;
            lblFailed.Visible = false;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(cs);
                    con.Open();
                    cmd = new SqlCommand("Insert into manager (manager_username, manager_name, manager_email, manager_address, manager_phone, password, role) values (@username, @name, @email, @address, @phone, @password, 'Manager')", con);
                    cmd.Parameters.AddWithValue("@username", txtManagerUsername.Text);
                    cmd.Parameters.AddWithValue("@name", txtManagerName.Text);
                    cmd.Parameters.AddWithValue("@email", txtManagerEmail.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@address", txtManagerAddress.Text);
                    cmd.Parameters.AddWithValue("@phone", txtManagerPhone.Text);
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Succesfully - New Branch Inserted";
                    }
                    con.Close();
            }
            catch (Exception ex)
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Username already exist";
                //lblFailed.Text = "Unccessfull - " + ex.Message;
                con.Close();
            }
        }

    }
}