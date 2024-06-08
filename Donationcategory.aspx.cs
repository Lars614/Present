using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fyp3
{
    public partial class Donationcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load donation container data into Repeater
                BindDonationContainers();
            }
        }

        protected void BindDonationContainers()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM DonationContainers", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDonationContainers.DataSource = dt;
                        rptDonationContainers.DataBind();
                    }
                }
            }
        }


        protected void btnAddContainer_Click(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                string name = txtName.Text;
                string imageUrl = txtImageUrl.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO DonationContainers (Name, ImageUrl) VALUES (@Name, @ImageUrl)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindDonationContainers();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                Button btn = (Button)sender;
                int id = Convert.ToInt32(btn.CommandArgument);

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM DonationContainers WHERE IdNum = @Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindDonationContainers();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect($"editdonationcontainer.aspx?id={id}");
        }

    }
}