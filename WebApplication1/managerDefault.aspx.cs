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
    public partial class empDefault : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToString(Session["role"]) == "Manager")
            {
                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("select m.manager_image, b.branch_id from manager m, branch b where b.manager_id=m.manager_id and m.manager_id=@manager_id", con);
                cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();
                if (dt.Rows.Count > 0)
                {
                    Image2.ImageUrl = Convert.ToString(dt.Rows[0]["manager_image"]);
                    Session["image"] = Convert.ToString(dt.Rows[0]["manager_image"]);
                    txtBranch.Text = Convert.ToString(dt.Rows[0]["branch_id"]);

                }

                cmd1 = new SqlCommand("select count(e.emp_id) as 'Emp' , max(e.emp_salary) as 'Max' , min(e.emp_salary) as 'Min', AVG(e.emp_salary) as 'Avg' from employee e, branch b where e.branch_id=b.branch_id and e.branch_id = @branch_id", con);
                cmd1.Parameters.AddWithValue("@branch_id", txtBranch.Text);
                SqlDataAdapter sd = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                sd.Fill(dt1);
                cmd.ExecuteNonQuery();
                if (dt1.Columns.Count > 0)
                {
                    lbl1.Text = Convert.ToString(dt1.Rows[0]["Emp"]);
                    lbl2.Text = "RM "+Convert.ToString(dt1.Rows[0]["Max"]);
                    lbl3.Text = "RM " + Convert.ToString(dt1.Rows[0]["Min"]);
                    lbl4.Text = "RM " + Convert.ToString(dt1.Rows[0]["Avg"]);
                }

                LoadData();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }

        void LoadData()
        {
            cmd1 = new SqlCommand("select e.emp_name, e.emp_salary from employee e where branch_id = @branch_id", con);
            cmd1.Parameters.AddWithValue("@branch_id", txtBranch.Text);
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