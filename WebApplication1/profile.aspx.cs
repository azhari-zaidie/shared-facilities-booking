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
    public partial class Test : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataAdapter adapter;
        string path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSuccess.Visible = false;
                lblFailed.Visible = false;
                if (Convert.ToString(Session["role"]) == "Admin")
                {
                    try
                    {
                        con = new SqlConnection(cs);
                        con.Open();
                        cmd = new SqlCommand("select manager_id, manager_username,manager_image, manager_name, manager_email,manager_address, manager_phone  from  manager where manager_id=@manager_id", con);
                        cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        cmd.ExecuteNonQuery();
                        if (dt.Rows.Count > 0)
                        {
                            //txtBranchPostalCode.Text = Convert.ToString(dt.Rows[0]["location_postalcode"]);
                            txtManagerAddress.Text = Convert.ToString(dt.Rows[0]["manager_address"]);
                            txtManagerName.Text = Convert.ToString(dt.Rows[0]["manager_name"]);
                            //txtBranchDate.Text = Convert.ToString(dt.Rows[0]["branch_date"]);
                            //drpStatus.SelectedValue = Convert.ToString(dt.Rows[0]["branch_status"]);
                            txtManagerEmail.Text = Convert.ToString(dt.Rows[0]["manager_email"]);
                            txtManagerPhone.Text = Convert.ToString(dt.Rows[0]["manager_phone"]);
                            txtManagerUsername.Text = Convert.ToString(dt.Rows[0]["manager_username"]);
                            Image1.ImageUrl = Convert.ToString(dt.Rows[0]["manager_image"]);
                            Image2.ImageUrl = Convert.ToString(dt.Rows[0]["manager_image"]);
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
                        //lblLogin.Visible = true;
                        lblFailed.Text = "Username already in used";
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }

            }
        }


        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //string manager_id = Request.QueryString["manager_id"];
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update manager set manager_name=@manager_name, manager_email=@manager_email, manager_phone=@manager_phone, manager_address=@manager_address where manager_id=@manager_id", con);
            cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
            cmd.Parameters.AddWithValue("@manager_name", txtManagerName.Text);
            //cmd.Parameters.AddWithValue("@manager_username", txtManagerUsername.Text);
            cmd.Parameters.AddWithValue("@manager_email", txtManagerEmail.Text);
            cmd.Parameters.AddWithValue("@manager_address", txtManagerAddress.Text);
            cmd.Parameters.AddWithValue("@manager_phone", txtManagerPhone.Text);
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

        protected void btnTest_Click(object sender, EventArgs e)
        {

            FileUpload1.PostedFile.SaveAs(Server.MapPath("images/") + FileUpload1.FileName.ToString());
            path = "images/" + FileUpload1.FileName.ToString();
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update manager set manager_image = '" + path.ToString() + "' where manager_id = @branch_id", con);
            cmd.Parameters.AddWithValue("@branch_id", Convert.ToString(Session["id"]));
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            con.Open();
            cmd = new SqlCommand("update manager set password=@password where manager_id=@manager_id", con);
            cmd.Parameters.AddWithValue("@manager_id", Convert.ToString(Session["id"]));
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                lblSuccess.Visible = true;
                lblSuccess.Text = "Succesfully - Password Updated";
            }
            else
            {
                lblFailed.Visible = true;
                lblFailed.Text = "Unccessfull - Password Not Updated";
            }
            con.Close();
        }
    }
}