using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CustomerForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            DisplayData();
        }

        public string conString = "Data Source=LAPTOP-JGDA9QT3\\TEW_SQLEXPRESS;Initial Catalog=Restaurant3;Integrated Security=True;Connect Timeout=30;Encrypt=False;ApplicationIntent=ReadWrite";

        //private int dupMobileCheck()
        //{
        //    SqlConnection con = new SqlConnection(conString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("Select Count(*) from Customer where PhoneNumber = '" + textBox3.Text + "'", con);
        //    return Convert.ToInt32(cmd.ExecuteScalar());
        //}

        private int dupIDCheck()
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Count(*) from Customer where CustomerID = '" + textBox1.Text + "'", con);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dupIDCheck() == 0)
            {
                    SqlConnection con = new SqlConnection(conString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Customer values('" + textBox1.Text + "', '" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text + "', '" + textBox5.Text + "', '" + textBox6.Text + "')", con);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Data Inserted Successfully.");
                    con.Close();
                    DisplayData();
            }
            else
            {
                MessageBox.Show("ID already exists!");
            }
        }

        //Display Data in DataGridView  
        private void DisplayData()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select * from Customer", con);
            adapt.Fill(dt);
            dataGridView1.DataSource = dt;
            con.Close();
        }
        private void DisplayCustomer()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select * from Customer where PhoneNumber like '" + textBox3.Text + "'", con);
            adapt.Fill(dt);
            dataGridView1.DataSource = dt;
            con.Close();
        }
        private void ClearData()
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
        }
        //Delete Record  
        private void btn_Delete_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                con.Open();
                SqlCommand cmd = new SqlCommand("delete Customer where CustomerID=('" + textBox1.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Record Deleted Successfully!");
                DisplayData();
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Select Record to Delete");
            }
        }

        //Update Record  
        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("update Customer set CustomerName=('" + textBox2.Text + "'), PhoneNumber=('" + textBox3.Text + "'), Area=('" + textBox4.Text + "'), HouseNo=('" + textBox5.Text + "'), StreetNo=('" + textBox6.Text + "') where CustomerID=('" + textBox1.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Record Updated Successfully");
                con.Close();
                DisplayCustomer();
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Select Record to Update");
            }
        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
        }



        private void btn_Search_Click(object sender, EventArgs e)
        {
            if (textBox3.Text != "")
            {
                DisplayCustomer();
            }
            else
            {
                MessageBox.Show("Please Insert a Phone Number!");
            }
        }

        private void btn_SearchEnd_Click(object sender, EventArgs e)
        {
            DisplayData();
            ClearData();
        }
    }
}
