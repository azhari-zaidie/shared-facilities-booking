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
    public partial class managerBranchDetails : System.Web.UI.Page
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
            string branch_id = Request.QueryString["branch_id"];

            if (Convert.ToString(Session["role"]) == "Manager")
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                try
                {
                    con = new SqlConnection(cs);
                    con.Open();
                    cmd = new SqlCommand("select b.branch_id, b.branch_name, b.branch_status, b.branch_date, b.branch_image, l.location_id, l.location_address, l.location_postalcode ,m.manager_id, m.manager_name, m.manager_address from branch b, location l, manager m where b.location_id=l.location_id and m.manager_id=b.manager_id and b.manager_id = @manager_id", con);
                    cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    cmd.ExecuteNonQuery();
                    if (dt.Rows.Count > 0)
                    {
                        txtBranchName.Text = Convert.ToString(dt.Rows[0]["branch_name"]);
                        txtBranchAddress.Text = Convert.ToString(dt.Rows[0]["location_address"]);
                        txtBranchPostalCode.Text = Convert.ToString(dt.Rows[0]["location_postalcode"]);
                        txtManagerAddress.Text = Convert.ToString(dt.Rows[0]["manager_address"]);
                        txtManagerName.Text = Convert.ToString(dt.Rows[0]["manager_name"]);
                        txtBranchDate.Text = Convert.ToString(dt.Rows[0]["branch_date"]);
                        txtBranchId.Text = Convert.ToString(dt.Rows[0]["branch_id"]);
                        drpStatus.SelectedValue = Convert.ToString(dt.Rows[0]["branch_status"]);
                        Image1.ImageUrl = Convert.ToString(dt.Rows[0]["branch_image"]);
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
                    lblFailed.Visible = true;
                    lblFailed.Text = "Unccessfull - " + ex.Message;

                    con.Close();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string branch_id = Request.QueryString["branch_id"];
                con = new SqlConnection(cs);
                con.Open();
                cmd = new SqlCommand("update branch set branch_status=@status where branch_id = @branch_id", con);
                cmd.Parameters.AddWithValue("@branch_id", txtBranchId.Text);
                cmd.Parameters.AddWithValue("@status", drpStatus.SelectedValue);
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Succesfully - Branch Updated";
                }
                else
                {
                    lblFailed.Visible = true;
                    lblFailed.Text = "Unccessfull - ";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - " +ex.Message;
                con.Close();
            }
            
            //Response.Redirect(Request.RawUrl);
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("images/") + FileUpload1.FileName.ToString());
            path = "images/" + FileUpload1.FileName.ToString();
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update branch set branch_image = '" + path.ToString() + "' where branch_id = @branch_id", con);
            cmd.Parameters.AddWithValue("@branch_id", txtBranchId.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}