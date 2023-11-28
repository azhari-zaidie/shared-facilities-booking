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
    public partial class empList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            this.GridView1.Visible = false;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            string emp_id = Request.QueryString["del"];
            if (Convert.ToString(Session["role"]) == "Admin")
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                if (emp_id != null)
                {

                    con = new SqlConnection(cs);
                    con.Open();
                    cmd = new SqlCommand("delete from employee where emp_id = @branch_id", con);
                    cmd.Parameters.AddWithValue("@branch_id", emp_id);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }
    }
}