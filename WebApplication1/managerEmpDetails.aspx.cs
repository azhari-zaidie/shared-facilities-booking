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
    public partial class managerEmpDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        string path;

       

        protected void Page_Load(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            lblFailed.Visible = false;
            string manager_id = Request.QueryString["emp_id"];
            if (!IsPostBack)
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                if (Convert.ToString(Session["role"]) == "Manager")
                {
                    try
                    {
                        con = new SqlConnection(cs);
                        con.Open();
                        cmd = new SqlCommand("select e.emp_id,e.emp_image, e.emp_name, e.emp_email, e.emp_phone, e.emp_address, e.emp_salary, e.emp_date, d.dept_name, d.dept_id, b.branch_name,j.job_id, j.job_name, l.location_address from employee e, departments d, branch b, job j, location l where e.dept_id = d.dept_id and e.job_id = j.job_id and b.branch_id = e.branch_id and b.location_id = l.location_id and e.emp_id = @manager_id", con);
                        cmd.Parameters.AddWithValue("@manager_id", manager_id);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        cmd.ExecuteNonQuery();
                        if (dt.Rows.Count > 0)
                        {
                            txtBranchName.Text = Convert.ToString(dt.Rows[0]["branch_name"]);
                            //txtBranchAddress.Text = Convert.ToString(dt.Rows[0]["location_address"]);
                            txtBranchAddress.Text = Convert.ToString(dt.Rows[0]["location_address"]);
                            //txtBranchPostalCode.Text = Convert.ToString(dt.Rows[0]["location_postalcode"]);
                            txtEmpAddress.Text = Convert.ToString(dt.Rows[0]["emp_address"]);
                            txtEmpName.Text = Convert.ToString(dt.Rows[0]["emp_name"]);
                            //txtBranchDate.Text = Convert.ToString(dt.Rows[0]["branch_date"]);
                            //drpStatus.SelectedValue = Convert.ToString(dt.Rows[0]["branch_status"]);
                            drpLocation1.SelectedValue = Convert.ToString(dt.Rows[0]["dept_id"]);
                            DropDownList1.SelectedValue = Convert.ToString(dt.Rows[0]["job_id"]);
                            //drpStatus.SelectedValue = Convert.ToString(dt.Rows[0]["branch_status"]);
                            txtEmpEmail.Text = Convert.ToString(dt.Rows[0]["emp_email"]);
                            txtEmpPhone.Text = Convert.ToString(dt.Rows[0]["emp_phone"]);
                            txtEmpSalary.Text = Convert.ToString(dt.Rows[0]["emp_salary"]);
                            txtEmpDate.Text = Convert.ToString(dt.Rows[0]["emp_date"]);
                            Image1.ImageUrl = Convert.ToString(dt.Rows[0]["emp_image"]);
                        }
                        else
                        {
                            //Session.Abandon();
                            //lblLogin.Visible = true;
                            //lblLogin.Text = "Incorrect Username or Password";
                            // lblLogin.Text = Convert.ToString(Session["id"]);
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        lblSuccess.Visible = true;
                        lblSuccess.Text = "test - " + ex.Message;
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
                
            }
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            string manager_id = Request.QueryString["emp_id"];
            FileUpload1.PostedFile.SaveAs(Server.MapPath("images/") + FileUpload1.FileName.ToString());
            path = "images/" + FileUpload1.FileName.ToString();
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update employee set emp_image = '" + path.ToString() + "' where emp_id = @branch_id", con);
            cmd.Parameters.AddWithValue("@branch_id", manager_id);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string manager_id = Request.QueryString["emp_id"];
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update employee set emp_name=@emp_name, emp_email=@emp_email, emp_address=@emp_address, emp_salary=@emp_salary, " +
                "emp_phone=@emp_phone, dept_id=@dept_id, job_id=@job_id where emp_id = @manager_id", con);
            cmd.Parameters.AddWithValue("@manager_id", manager_id);
            cmd.Parameters.AddWithValue("@emp_name", txtEmpName.Text);
            cmd.Parameters.AddWithValue("@emp_email", txtEmpEmail.Text);
            cmd.Parameters.AddWithValue("@emp_address", txtEmpAddress.Text);
            cmd.Parameters.AddWithValue("@emp_salary", txtEmpSalary.Text);
            cmd.Parameters.AddWithValue("@emp_phone", txtEmpPhone.Text);
            cmd.Parameters.AddWithValue("@dept_id", drpLocation1.SelectedValue);
            cmd.Parameters.AddWithValue("@job_id", DropDownList1.SelectedValue);
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                lblSuccess.Visible = true;
                lblSuccess.Text = "Succesfully - Manager Updated";
            }
            else
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Manager Not Updated";
            }
            con.Close();

        }
    }
}