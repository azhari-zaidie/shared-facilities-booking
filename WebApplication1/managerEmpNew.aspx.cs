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
    public partial class managerEmpNew : System.Web.UI.Page
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
                lblSuccess.Visible = false;
                lblFailed.Visible = false;
                con = new SqlConnection(cs);
                con.Open();

                cmd1 = new SqlCommand("select * from branch where manager_id = @manager_id", con);
                cmd1.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd1.ExecuteNonQuery();
                //lblSuccess.Visible = true;
                

                if (dt.Rows.Count > 0)
                {
                    txtBranchid.Text = Convert.ToString(dt.Rows[0]["branch_id"]);
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(cs);
                con.Open();

                cmd = new SqlCommand("insert into employee (emp_name, emp_email, emp_address, emp_salary, emp_date, emp_phone, dept_id, branch_id, job_id) " +
                    "values (@name, @email, @address, @salary, GETDATE(), @phone, @dept, @branch, @job)", con);
                cmd.Parameters.AddWithValue("@name", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmpEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtEmpAddress.Text);
                cmd.Parameters.AddWithValue("@salary", txtEmpSalary.Text);
                cmd.Parameters.AddWithValue("@phone", txtEmpPhone.Text);
                cmd.Parameters.AddWithValue("@branch", txtBranchid.Text);
                cmd.Parameters.AddWithValue("@dept", drpLocation1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@job", DropDownList1.SelectedItem.Value);
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
                lblFailed.Text = "Unccessfull - " +ex.Message;
                con.Close();
            }
        }
    }
}