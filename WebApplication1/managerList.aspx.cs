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
    public partial class managerList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            string manager_id = Request.QueryString["del"];
            lblFailed.Visible = false;
            lblSuccess.Visible = false;
            if (Convert.ToString(Session["role"]) == "Admin")
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                if (manager_id != null)
                {
                    try
                    {
                        con = new SqlConnection(cs);
                        con.Open();
                        cmd = new SqlCommand("delete from manager where manager_id = @manager_id", con);
                        cmd.Parameters.AddWithValue("@manager_id", manager_id);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Successfully - Deleted Manager";
                    }
                    catch (Exception ex)
                    {
                        lblFailed.Visible = true;
                        lblFailed.Text = "Unsuccesfull - Manager is still in used";
                        con.Close();
                    }
                    
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
                
        }

    }
}