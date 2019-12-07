using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;
using System.Collections;

namespace ProjetoP2.Content
{
    public partial class Cesta : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        String produtos = "";



        protected void Page_Load(object sender, EventArgs e)
        {
            String codigo = Request.QueryString["Codigo"];
            String sessionID = retornarSession();
            String nomeCliente = "";
            if (Session["nomeCliente"] != null)
            {
                nomeCliente = Session["nomeCliente"].ToString();
            }
            String codigoCliente = "";
            if (Session["codigoCliente"] != null)
            {
                codigoCliente = Session["codigoCliente"].ToString();
            }
            
            String valor = retornarValor(codigo);
            if (codigo != null) { 
                inserirProduto(codigo, sessionID, valor, codigoCliente);
            }
            carregarTela(sessionID);

            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }

        private void inserirProduto(String codigo, String sessionID, String valor, String codigoCliente)
        {
            MySqlConnection conn = new MySqlConnection(sc);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            comm.CommandText = "insert into cesta(sessionId, codigoCliente, codigoProduto, quantidade, valorUnitario, valorTotal) values(@sessionId, @codigoCliente, @codigoProduto, @quantidade, @valorUnitario, @valorTotal)";
            comm.Parameters.AddWithValue("@sessionId", sessionID);
            comm.Parameters.AddWithValue("@codigoCliente", codigoCliente);
            comm.Parameters.AddWithValue("@codigoProduto", codigo);
            comm.Parameters.AddWithValue("@quantidade", 1);
            comm.Parameters.AddWithValue("@valorUnitario", float.Parse(valor));
            comm.Parameters.AddWithValue("@valorTotal", float.Parse(valor));
            comm.ExecuteNonQuery();
            conn.Close();
        }

        private void carregarTela(String sessionID)
        {
            float subtotal = 0;

            MySqlConnection myConn = new MySqlConnection(sc);

            MySqlCommand commandCount = myConn.CreateCommand();
            commandCount.CommandText = "select * from cesta where sessionId = \"" + sessionID + "\"";
            MySqlDataReader myReaderCount;

            try
            {
                int i = 1;

                myConn.Open();

                myReaderCount = commandCount.ExecuteReader();
                while (myReaderCount.Read())
                {
                    produtos += geraProdutos(myReaderCount, i);
                    subtotal += float.Parse(myReaderCount["valorTotal"].ToString());

                    ++i;
                }
                produtosCesta.Text = produtos;
            }
            catch (Exception ex) {}
            myConn.Close();
            valorSubtotal.Text = subtotal.ToString();
            valorTotal.Text = (subtotal + 20).ToString();
        }
        
        private String retornarSession()
        {
            if (Session["ID"] == null)
            {
                Session["ID"] = Guid.NewGuid().ToString();
            }
            return Session["ID"].ToString();
        }
        private String retornarValor(String codigo)
        {
            String retValor = "";
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from produto where codigo = " + codigo + " order by codigo limit 1";
            MySqlDataReader myReader;

            try
            {
                int i = 1;

                myConn.Open();

                myReader = command.ExecuteReader();
                while (myReader.Read())
                {
                    retValor =  myReader["valor"].ToString();
                }
            }
            catch (Exception ex) {}
            myConn.Close();
            return retValor;
        }

        private String retornarTitulo(String codigo)
        {
            String retTitulo = "";
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from produto where codigo = " + codigo + " order by codigo limit 1";
            MySqlDataReader myReader;

            try
            {
                int i = 1;

                myConn.Open();

                myReader = command.ExecuteReader();
                while (myReader.Read())
                {
                    retTitulo = myReader["titulo"].ToString();
                }
            }
            catch (Exception ex) { }
            myConn.Close();
            return retTitulo;
        }
        private string geraProdutos(MySqlDataReader myReaderCount, int i)
        {

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("");
            sb.AppendLine("<tbody>");
            sb.AppendLine("<tr><td class=\"produto\">"+retornarTitulo(myReaderCount["codigoProduto"].ToString()) +"</td>");
            sb.AppendLine("<td class=\"preco - item\">R$ "+ myReaderCount["valorUnitario"].ToString() + "</td>");
            sb.AppendLine("<td class=\"quantidade - item\">"+ myReaderCount["quantidade"].ToString() + "</td>");
            sb.AppendLine("<td class=\"valor - total\">R$ "+ myReaderCount["valorTotal"].ToString() + "</td>");
            sb.AppendLine("</tr></tbody>");
            
            return sb.ToString();
        }

        protected void limparCesta(object sender, EventArgs e)
        {
            /*
            MySqlConnection conn = new MySqlConnection(sc);
            conn.Open();
            MySqlCommand comm = conn.CreateCommand();
            comm.CommandText = "delete from cesta where sessionId = \"@sessionId\";";
            comm.Parameters.AddWithValue("@sessionId", retornarSession());
            comm.ExecuteNonQuery();
            conn.Close();
            */
            MySqlConnection con = new MySqlConnection(sc);
            con.Open();
            String sql = "delete from cesta where sessionId=\""+retornarSession()+"\"" ;

            MySqlCommand comando = new MySqlCommand(sql, con);
            comando.ExecuteNonQuery();
            con.Close();

            produtosCesta.Text = "";
            valorSubtotal.Text = "0,00";
            valorTotal.Text = "0,00";

        }
    }
}