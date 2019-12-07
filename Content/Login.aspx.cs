using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace ProjetoP2.Content
{
    public partial class Login : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }
        protected void entrar(object sender, EventArgs e)
        {
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from cliente where email = \"" + email.Value + "\" and senha = \""+ senha.Value + "\" limit 1";
            MySqlDataReader myReader;

            Boolean logado = false;

            try
            {
                int i = 1;

                myConn.Open();

                myReader = command.ExecuteReader();
                if (myReader.Read())
                {
                    Session["codigoCliente"] = myReader["codigo"].ToString();
                    Session["nomeCliente"] = myReader["nome"].ToString();
                    lblMensagem.Text = "Logado.";
                    logado = true;

                } else
                {
                    lblMensagem.Text = "Usuário ou senha inválida.";
                }
            }
            catch (Exception ex) { }
            myConn.Close();
            if (logado)
            {
                Response.Redirect("Vitrine.aspx");
            }
            
        }
    }
}