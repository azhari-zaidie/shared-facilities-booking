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
    public partial class branchNew : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["role"]) == "Admin")
            {
                Image2.ImageUrl = Convert.ToString(Session["image"]);
                lblSuccess.Visible = false;
                lblFailed.Visible = false;
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
                    cmd = new SqlCommand("insert into branch values (@name, 'Unavailable', GETDATE(),'none', @location, @manager)", con);
                    cmd.Parameters.AddWithValue("@name", txtBranchName.Text);
                    cmd.Parameters.AddWithValue("@location", drpLocation1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@manager", drpManager.SelectedItem.Value);
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
                lblFailed.Text = "Unccessfull - Refresh the page";
                con.Close();
            }
            
        }
    }
}