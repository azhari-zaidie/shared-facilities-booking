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
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogin.Visible = false;
            if (!IsPostBack)
            {
                Session.Abandon();
            }
            
            //Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String role;
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("select * from manager where manager_username=@username and password=@password", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPsw1.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                if (dt.Rows.Count>0)
                {
                    Session["id"] = dt.Rows[0]["manager_id"].ToString();
                    Session["role"] = dt.Rows[0]["role"].ToString();
                    
                    //lblLogin.Visible = true;
                    //lblLogin.Text = dt.Rows[0]["manager_id"].ToString();
                    role = Convert.ToString(dt.Rows[0]["role"]); 
                    if(role == "Admin")
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/managerDefault.aspx");
                    }
                    //lblLogin.Text = Convert.ToString(Session["id"]);
                }
                else
                {
                    //Session.Abandon();
                    lblLogin.Visible = true;
                    lblLogin.Text = "Incorrect Username or Password";
                   // lblLogin.Text = Convert.ToString(Session["id"]);
                }
                    con.Close();
            }
        }
    }
}