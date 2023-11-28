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
    public partial class register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Visible = false;
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
                try
                {
                    using (con = new SqlConnection(cs))
                    {
                        con.Open();
                        cmd = new SqlCommand("Insert into manager (manager_username, manager_name, manager_email, password, role) values (@username, @name, @email, @password, 'Manager')", con);
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@name", txtFullname.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@password", txtPsw1.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        
                    }
                }
                catch (Exception ex)
                {
                    //Response.Write("<script>alert('Test');</script>");
                    lblUsername.Visible = true;
                    lblUsername.Text = "*Username already exist";
                }
        }

        protected void resetBtn_Click(object sender, EventArgs e)
        {
            
        }
    }
}