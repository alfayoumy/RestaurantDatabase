using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MainForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void CusFormBtn_Click(object sender, EventArgs e)
        {
            CustomerForm.Form1 frm = new CustomerForm.Form1();
            DialogResult selectButton = frm.ShowDialog();
        }

        private void OnlOrbtn_Click(object sender, EventArgs e)
        {
            OnlineOrderForm.Form1 frm = new OnlineOrderForm.Form1();
            DialogResult selectButton = frm.ShowDialog();
        }

        private void PaymentRep_Click(object sender, EventArgs e)
        {
            PaymentsReport.Form1 frm = new PaymentsReport.Form1();
            DialogResult selectButton = frm.ShowDialog();
        }
    }
}
