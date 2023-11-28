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
    public partial class managerEmpList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["role"]) == "Manager")
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                con = new SqlConnection(cs);
                con.Open();

                cmd1 = new SqlCommand("select * from branch where manager_id = @manager_id", con);
                cmd1.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                if (dt.Rows.Count > 0)
                {
                    txtBranchid.Text = Convert.ToString(dt.Rows[0]["branch_id"]);
                    lblBranchname.Text = Convert.ToString(dt.Rows[0]["branch_name"]);
                }

                string manager_id = Request.QueryString["del"];

                if (manager_id != null)
                {

                    con = new SqlConnection(cs);
                    con.Open();
                    cmd = new SqlCommand("delete from employee where emp_id = @manager_id", con);
                    cmd.Parameters.AddWithValue("@manager_id", manager_id);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                DataBind();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}