using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
namespace WebApplication1
{
    public partial class _Default : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["role"]) == "Admin")
            {
                idManager.Text = Convert.ToString(Session["id"]);

                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("select * from manager where manager_id=@manager_id", con);
                cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                if (dt.Rows.Count > 0)
                {
                    Image2.ImageUrl = Convert.ToString(dt.Rows[0]["manager_image"]);
                    Session["image"] = Convert.ToString(dt.Rows[0]["manager_image"]);

                    
                }

                cmd1 = new SqlCommand("select (select count(emp_id) from employee) as 'Emp', count(b.branch_id) as 'Branch', (select count(manager_id) from manager) as 'Manager' , (select count(location_id) from location) as 'Location' from   branch b", con);
                SqlDataAdapter sd = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                sd.Fill(dt1);
                cmd.ExecuteNonQuery();
                if (dt1.Columns.Count > 0)
                {
                    lbl1.Text = Convert.ToString(dt1.Rows[0]["Emp"]);
                    lbl2.Text = Convert.ToString(dt1.Rows[0]["Branch"]);
                    lbl3.Text = Convert.ToString(dt1.Rows[0]["Manager"]);
                    lbl4.Text = Convert.ToString(dt1.Rows[0]["Location"]);
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

    }
}