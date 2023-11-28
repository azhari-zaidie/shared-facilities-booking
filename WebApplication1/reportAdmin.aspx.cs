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
    public partial class reportAdmin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
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

            

                LoadData();
                LoadData2();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        void LoadData()
        {
            cmd1 = new SqlCommand("select b.branch_name, count(e.emp_id) from branch b, employee e where e.branch_id = b.branch_id group by b.branch_name", con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sd.Fill(dt1);
            cmd.ExecuteNonQuery();
            string[] x = new string[dt1.Rows.Count];
            int[] y = new int[dt1.Rows.Count];

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                x[i] = dt1.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt1.Rows[i][1].ToString());
            }

            ctl01.Series[0].Points.DataBindXY(x, y);
            ctl01.Series[0].ChartType = SeriesChartType.StackedBar;
        }

        void LoadData2()
        {
            cmd1 = new SqlCommand("select e.emp_name, e.emp_salary from employee e", con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sd.Fill(dt1);
            cmd.ExecuteNonQuery();
            string[] x = new string[dt1.Rows.Count];
            int[] y = new int[dt1.Rows.Count];

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                x[i] = dt1.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt1.Rows[i][1].ToString());
            }

            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = SeriesChartType.StackedColumn;
        }
    }
}