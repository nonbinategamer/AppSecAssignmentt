using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace AppSecAssignmentt
{
    public partial class Registration : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString; 
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pwd = tb_password.Text.ToString().Trim(); ;
            //Generate random "salt"
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];

            //Fills array of bytes with a cryptographically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);

            SHA512Managed hashing = new SHA512Managed();

            string pwdWithSalt = pwd + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));

            finalHash = Convert.ToBase64String(hashWithSalt);

            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;

            createAccount();

            {
                // implement codes for the button event
                // Extract data from textbox
                int scores = chkPass(tb_password.Text);
                string status = "";
                switch (scores)
                {
                    case 1:
                        status = "Very Weak";
                        break;
                    case 2:
                        status = "Weak";
                        break;
                    case 3:
                        status = "Medium";
                        break;
                    case 4:
                        status = "Strong";
                        break;
                    default:
                        break;
                }
                lbl_pwdchecker.Text = "Status : " + status;
                if (scores < 4)
                {
                    lbl_pwdchecker.ForeColor = Color.Red;
                    return;
                }
                lbl_pwdchecker.ForeColor = Color.Green;
            }
            Response.Redirect("Login.aspx", false);
        }
            private int chkPass(string password)
        {
            int score = 0;

            if(password.Length < 12)
            {
                return 1;
            }

            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }

            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }

            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }

            if (Regex.IsMatch(password, "[^a-zA-Z0-9]"))
            {
                score++;
            }

            return score;
        }
        protected void createAccount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@fname, @lname, @creditcard, @email, @passwordhash, @passwordsalt, @dob, @photo, @iv, @key)"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@fname", tb_fname.Text.Trim());
                            cmd.Parameters.AddWithValue("@lname", tb_lname.Text.Trim());
                            cmd.Parameters.AddWithValue("@creditcard", Convert.ToBase64String(encryptData(tb_cc.Text.Trim())));
                            cmd.Parameters.AddWithValue("@email", tb_email.Text.Trim());
                            cmd.Parameters.AddWithValue("@passwordhash", finalHash);
                            cmd.Parameters.AddWithValue("@passwordsalt", salt);
                            cmd.Parameters.AddWithValue("@dob", tb_dob.Text.Trim());
                            cmd.Parameters.AddWithValue("@photo", DBNull.Value);
                            cmd.Parameters.AddWithValue("@iv", Convert.ToBase64String(IV));
                            cmd.Parameters.AddWithValue("@key", Convert.ToBase64String(Key));
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }
    }
}