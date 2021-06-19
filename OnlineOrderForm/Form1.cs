using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace OnlineOrderForm
{
public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            DisplayMenu();
            DisplayOrders();
            DisplayCustomers();
        }

        public string conString = "Data Source=LAPTOP-JGDA9QT3\\TEW_SQLEXPRESS;Initial Catalog=Restaurant3;Integrated Security=True;Connect Timeout=30;Encrypt=False;ApplicationIntent=ReadWrite";

        //check duplicate
        private int dupCheck()
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Count(*) from Orders where OrderID = '" + OrderIDtxt.Text + "'", con);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        //Add order
        private void button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            if (dupCheck()==0)
            {
                DateTime time = DateTime.ParseExact(Timetxt.Text.ToString(), "HH:mm", null);
                SqlCommand cmd = new SqlCommand("insert into Orders values('" + OrderIDtxt.Text + "', '" + dateTimePicker1.Value + "', '" + time + "', '" + Statustxt.Text + "', 'O')", con);
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("insert into OnlineOrder values('" + OrderIDtxt.Text + "', '" + CustomerIDtxt.Text + "', (select top 1 DeliveryBoyID from DeliveryBoy where Area='" + Areatxt.Text + "'))", con);
                cmd2.ExecuteNonQuery();
                MessageBox.Show("Data Inserted Successfully.");
                con.Close();
                DisplayOrders();
            }
            else
            {
                MessageBox.Show("Order ID already exists!");
            }
        }

        private void DisplayPlacedOrder()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select PhoneNumber, CustomerName, Customer.CustomerID, Orders.OrderID, OrderDate, OrderTime, OrderStatus, ItemName, QuantityOrdered from Orders, OnlineOrder, Customer, OrderItems, MenuItems where Orders.OrderID=OnlineOrderID AND OnlineOrderID=OrderItems.OrderID AND Customer.CustomerID=OnlineOrder.CustomerID AND MenuItems.ItemID=OrderItems.ItemID", con);
            adapt.Fill(dt);
            dataGridView2.DataSource = dt;
            con.Close();
        }

        //Add order items
        private void button5_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into orderitems values('" + textBox12.Text + "', '" + textBox13.Text + "', '" + textBox14.Text + "')", con);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Data Inserted Successfully.");
            con.Close();
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select PhoneNumber, CustomerName, Customer.CustomerID, Orders.OrderID, OrderDate, OrderTime, OrderStatus, ItemName, QuantityOrdered from Orders, OnlineOrder, Customer, OrderItems, MenuItems where Orders.OrderID=OnlineOrderID AND OnlineOrderID=OrderItems.OrderID AND Customer.CustomerID=OnlineOrder.CustomerID AND MenuItems.ItemID=OrderItems.ItemID AND Orders.OrderID like '" + OrderIDtxt.Text + "'", con);
            adapt.Fill(dt);
            dataGridView2.DataSource = dt;
            con.Close();
        }

        //Display MenuItems in DataGridView  
        private void DisplayMenu()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select * from MenuItems", con);
            adapt.Fill(dt);
            dataGridView1.DataSource = dt;
            con.Close();
        }

        private void dataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            OrderIDtxt.Text = dataGridView2.Rows[e.RowIndex].Cells[3].Value.ToString();
            textBox12.Text = dataGridView2.Rows[e.RowIndex].Cells[3].Value.ToString();
            CustomerPhonetxt.Text = dataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
            CustomerIDtxt.Text = dataGridView2.Rows[e.RowIndex].Cells[2].Value.ToString();
            Statustxt.Text = dataGridView2.Rows[e.RowIndex].Cells[6].Value.ToString();
            //dateTimePicker1.Value = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            //textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            //textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            //textBox5.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            //textBox6.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            textBox13.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
        }

        //Display Customers  
        private void DisplayCustomers()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select * from Customer", con);
            adapt.Fill(dt);
            dataGridView3.DataSource = dt;
            con.Close();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            if (CustomerPhonetxt.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter adapt;
                con.Open();
                DataTable dt = new DataTable();
                adapt = new SqlDataAdapter("select * from Customer where PhoneNumber like '" + CustomerPhonetxt.Text + "'", con);
                adapt.Fill(dt);
                dataGridView3.DataSource = dt;
                con.Close();
            }
            else
            {
                MessageBox.Show("Please Insert a Phone Number!");
            }
        }

        //Update Order
        private void UpdateOrbtn(object sender, EventArgs e)
        {
            if (OrderIDtxt.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("update Orders set OrderStatus=('" + Statustxt.Text + "') where OrderID=('" + OrderIDtxt.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Record Updated Successfully");
                con.Close();
                RefreshAll();
            }
            else
            {
                MessageBox.Show("Please Select Record to Update");
            }
        }

        private void SearchOrderbtn(object sender, EventArgs e)
        {
            if (CustomerPhonetxt.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter adapt;
                con.Open();
                DataTable dt = new DataTable();
                adapt = new SqlDataAdapter("select PhoneNumber, CustomerName, Customer.CustomerID, OrderID, OrderDate, OrderTime, OrderStatus, OrderType, DeliveryBoy.DeliveryBoyID, DBName, ContactNumber from Orders, OnlineOrder, Customer, DeliveryBoy where OrderID=OnlineOrderID AND Customer.CustomerID=OnlineOrder.CustomerID AND DeliveryBoy.DeliveryBoyID=OnlineOrder.DeliveryBoyID AND PhoneNumber like '" + CustomerPhonetxt.Text + "'", con);
                adapt.Fill(dt);
                dataGridView2.DataSource = dt;
                con.Close();
            }
            else
            {
                MessageBox.Show("Please Insert a Phone Number!");
            }
        }

        private void dataGridView3_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            CustomerPhonetxt.Text = dataGridView3.Rows[e.RowIndex].Cells[2].Value.ToString();
            CustomerIDtxt.Text = dataGridView3.Rows[e.RowIndex].Cells[0].Value.ToString();
            Areatxt.Text = dataGridView3.Rows[e.RowIndex].Cells[3].Value.ToString();
        }

        //Display Orders
        private void DisplayOrders()
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select PhoneNumber, CustomerName, Customer.CustomerID, OrderID, OrderDate, OrderTime, OrderStatus, OrderType, DeliveryBoy.DeliveryBoyID, DBName, ContactNumber from Orders, OnlineOrder, Customer, DeliveryBoy where OrderID=OnlineOrderID AND Customer.CustomerID=OnlineOrder.CustomerID AND DeliveryBoy.DeliveryBoyID=OnlineOrder.DeliveryBoyID", con);
            adapt.Fill(dt);
            dataGridView2.DataSource = dt;
            con.Close();
        }

        //Delete Record  
        private void btn_Delete_Click(object sender, EventArgs e)
        {
            if (OrderIDtxt.Text != "")
            {
                SqlConnection con = new SqlConnection(conString);
                con.Open();
                SqlCommand cmd = new SqlCommand("delete Orders where OrderID=('" + OrderIDtxt.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Record Deleted Successfully!");
                DisplayOrders();
                ClearTextBoxes();
            }
            else
            {
                MessageBox.Show("Please Select an Order to Delete");
            }
        }

        //Clear
        private void ClearTextBoxes()
        {
            Action<Control.ControlCollection> func = null;

            func = (controls) =>
            {
                foreach (Control control in controls)
                    if (control is TextBox)
                        (control as TextBox).Clear();
                    else
                        func(control.Controls);
            };

            func(Controls);
        }

        //Refresh
        private void RefreshAll()
        {
            DisplayMenu();
            DisplayCustomers();
            DisplayOrders();
            ClearTextBoxes();
        }


        private void Refreshbtn(object sender, EventArgs e)
        {
            RefreshAll();
        }

        private void AllOrdersbtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter adapt;
            con.Open();
            DataTable dt = new DataTable();
            adapt = new SqlDataAdapter("select PhoneNumber, CustomerName, Customer.CustomerID, Orders.OrderID, OrderDate, OrderTime, OrderStatus, ItemName, QuantityOrdered from Orders, OnlineOrder, Customer, OrderItems, MenuItems where Orders.OrderID=OnlineOrderID AND OnlineOrderID=OrderItems.OrderID AND Customer.CustomerID=OnlineOrder.CustomerID AND MenuItems.ItemID=OrderItems.ItemID AND Orders.OrderID like '" + OrderIDtxt.Text + "'", con);
            adapt.Fill(dt);
            dataGridView2.DataSource = dt;
            con.Close();
        }


    }
}
