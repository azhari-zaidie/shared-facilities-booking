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
    public partial class branchList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            lblFailed.Visible = false;
            Image2.ImageUrl = Convert.ToString(Session["image"]);
            string branch_id = Request.QueryString["del"];
            if (Convert.ToString(Session["role"]) == "Admin")
            {
                if (branch_id != null)
                {
                    try
                    {
                        con = new SqlConnection(cs);
                        con.Open();
                        cmd = new SqlCommand("delete from branch where branch_id = @branch_id", con);
                        cmd.Parameters.AddWithValue("@branch_id", branch_id);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        lblSuccess.Visible = true;
                        lblSuccess.Text = "Succesfully - Branch Deleted";
                    }
                    catch(Exception ex)
                    {
                        lblFailed.Visible = true;
                        lblFailed.Text = "Unccessfull - Branch Not Deleted";
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