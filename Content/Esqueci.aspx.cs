using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;

namespace ProjetoP2.Content
{
    public partial class Esqueci : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }
        protected void enviarEmail(object sender, EventArgs e)
        {
            MySqlConnection myConn = new MySqlConnection(sc);

            MySqlCommand commandCount = myConn.CreateCommand();
            commandCount.CommandText = "select * from cliente where email = \"" + email1.Value + "\"";
            MySqlDataReader myReaderCount;

            try
            {
                int i = 1;

                myConn.Open();

                myReaderCount = commandCount.ExecuteReader();
                if (myReaderCount.Read())
                {
                    MailAddress de = new MailAddress("fatecpwAds2016@outlook.com");
                    MailAddress para = new MailAddress(myReaderCount["email"].ToString());
                    MailMessage email = new MailMessage(de, para);
                    email.Subject = "Senha - Softwave";
                    email.IsBodyHtml = true;
                    String corpo = "Senha: " + myReaderCount["senha"].ToString();
                    email.Body = corpo;
                    SmtpClient smtp = new SmtpClient("smtp-mail.outlook.com");
                    try
                    {
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.Credentials = new
                            NetworkCredential("fatecpwAds2016@outlook.com", "FreiJoao59");
                        smtp.Send(email);

                        lblMensagem.Text = "E-mail enviado.";
                        
                    }
                    catch
                    {
                        lblMensagem.Text = "Ocorreu um erro no envio de email.";
                    }


                    ++i;
                } else
                {
                    lblMensagem.Text = "E-mail não cadastrado.";
                }
            }
            catch (Exception ex) { }
            myConn.Close();
        }

        
    }
}