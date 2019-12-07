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
    public partial class Cadastro : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }
        protected void enviar(object sender, EventArgs e)
        {
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from cliente where email = \"" + usuario.Value + "\" limit 1";
            MySqlDataReader myReader;

            try
            {
                int i = 1;

                myConn.Open();

                myReader = command.ExecuteReader();
                if (myReader.Read())
                {
                    atualiza();
                } else
                {
                    insere();
                }
            }
            catch (Exception ex) { }
            myConn.Close();
        }

        protected void atualiza()
        {
            MySqlConnection conn = new MySqlConnection(sc);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            comm.CommandText = "update cliente set nome=@nome, email=@email, senha=@senha, documento=@documento, telefone=@telefone where email = @email";
            comm.Parameters.AddWithValue("@nome", nome.Value);
            comm.Parameters.AddWithValue("@email", usuario.Value);
            comm.Parameters.AddWithValue("@senha", senha1.Value);
            comm.Parameters.AddWithValue("@documento", cpf.Value);
            comm.Parameters.AddWithValue("@telefone", telefone.Value);
            comm.ExecuteNonQuery();
            conn.Close();
            //Response.Redirect("Vitrine.aspx");
            lblMensagem.Text = "Cadastro atualizado.";
        }
        protected void insere()
        {
            Random r = new Random();

            MySqlConnection conn = new MySqlConnection(sc);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            comm.CommandText = "insert into cliente (codigo, nome, email, senha, documento, telefone) values(@codigo, @nome, @email, @senha, @documento, @telefone)";
            comm.Parameters.AddWithValue("@codigo", r.Next().ToString());
            comm.Parameters.AddWithValue("@nome", nome.Value);
            comm.Parameters.AddWithValue("@email", usuario.Value);
            comm.Parameters.AddWithValue("@senha", senha1.Value);
            comm.Parameters.AddWithValue("@documento", cpf.Value);
            comm.Parameters.AddWithValue("@telefone", telefone.Value);
            comm.ExecuteNonQuery();
            conn.Close();
            //Response.Redirect("Vitrine.aspx");

            lblMensagem.Text = "Cadastro realizado.";
        }
    }
}