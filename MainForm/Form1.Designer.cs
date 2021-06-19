
namespace MainForm
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.CusFormBtn = new System.Windows.Forms.Button();
            this.OnlOrbtn = new System.Windows.Forms.Button();
            this.PaymentRep = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // CusFormBtn
            // 
            this.CusFormBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CusFormBtn.Location = new System.Drawing.Point(130, 82);
            this.CusFormBtn.Name = "CusFormBtn";
            this.CusFormBtn.Size = new System.Drawing.Size(307, 87);
            this.CusFormBtn.TabIndex = 0;
            this.CusFormBtn.Text = "Customer Form";
            this.CusFormBtn.UseVisualStyleBackColor = true;
            this.CusFormBtn.Click += new System.EventHandler(this.CusFormBtn_Click);
            // 
            // OnlOrbtn
            // 
            this.OnlOrbtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.OnlOrbtn.Location = new System.Drawing.Point(130, 195);
            this.OnlOrbtn.Name = "OnlOrbtn";
            this.OnlOrbtn.Size = new System.Drawing.Size(307, 87);
            this.OnlOrbtn.TabIndex = 1;
            this.OnlOrbtn.Text = "Online Order Form";
            this.OnlOrbtn.UseVisualStyleBackColor = true;
            this.OnlOrbtn.Click += new System.EventHandler(this.OnlOrbtn_Click);
            // 
            // PaymentRep
            // 
            this.PaymentRep.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PaymentRep.Location = new System.Drawing.Point(130, 309);
            this.PaymentRep.Name = "PaymentRep";
            this.PaymentRep.Size = new System.Drawing.Size(307, 87);
            this.PaymentRep.TabIndex = 2;
            this.PaymentRep.Text = "Payments Report";
            this.PaymentRep.UseVisualStyleBackColor = true;
            this.PaymentRep.Click += new System.EventHandler(this.PaymentRep_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(590, 480);
            this.Controls.Add(this.PaymentRep);
            this.Controls.Add(this.OnlOrbtn);
            this.Controls.Add(this.CusFormBtn);
            this.Name = "Form1";
            this.Text = "Restaurant Management";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button CusFormBtn;
        private System.Windows.Forms.Button OnlOrbtn;
        private System.Windows.Forms.Button PaymentRep;
    }
}

