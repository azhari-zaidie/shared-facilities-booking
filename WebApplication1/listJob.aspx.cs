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
    public partial class listJob : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                lblSuccess.Visible = false;
                lblFailed.Visible = false;
                if (Convert.ToString(Session["role"]) != "Admin")
                {
                    Response.Redirect("login.aspx");
                }
            }
            else
            {
                lblSuccess.Visible = false;
                lblFailed.Visible = false;
            }
        }
        public void DataLoad()
        {
            GridView1.DataBind();

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDepartment.Text = GridView1.SelectedRow.Cells[2].Text;
            txtDepartmentId.Text = GridView1.SelectedRow.Cells[1].Text;
        }


        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("Insert into departments (dept_name) values (@dept_name)", con);
                cmd.Parameters.AddWithValue("@dept_name", txtDepartment.Text);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Succesfully - New Department Inserted";
                }
                con.Close();
                DataLoad();
            }
            catch (Exception ex)
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Departmnet Name Already in Used";
                //lblFailed.Text = "Unccessfull - " + ex.Message;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("delete from departments where dept_id=@dept_id", con);
                cmd.Parameters.AddWithValue("@dept_id", txtDepartmentId.Text);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Succesfully - Department Deleted";
                }
                con.Close();
                DataLoad();
            }
            catch (Exception ex)
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Departmnet Still In Used";
                //lblFailed.Text = "Unccessfull - " + ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("update departments set dept_name=@dept_name where dept_id=@dept_id", con);
                cmd.Parameters.AddWithValue("@dept_id", txtDepartmentId.Text);
                cmd.Parameters.AddWithValue("@dept_name", txtDepartment.Text);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Succesfully - Department Updated";
                }
                con.Close();
                DataLoad();
            }
            catch (Exception ex)
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Cannot Update The Department";
                //lblFailed.Text = "Unccessfull - " + ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtDepartment.Text = "";
            txtDepartmentId.Text = "";
        }
    }
}