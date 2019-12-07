using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

namespace ProjetoP2.Content
{
    public partial class Vitrine : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        String produtos = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " ("+Session["nomeCliente"].ToString()+")";
            }
            carregarTela();
        }

        private void carregarTela()
        {
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from produto where destaque = true order by codigo limit 6";
            MySqlDataReader myReader;

            int i = 1;
            
            try
            {
                myConn.Open();
                myReader = command.ExecuteReader();

                while (myReader.Read())
                {

                    /*
                    Label tituloProduto = this.FindControl("tituloProduto" + i) as Label;
                    tituloProduto.Text = myReader["titulo"].ToString();

                    Label valorProduto = this.FindControl("valorProduto" + i) as Label;
                    valorProduto.Text = myReader["valor"].ToString();
                    
                    Image imagemProduto = this.FindControl("imagemProduto" + i) as Image;
                    imagemProduto.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";
                    */
                    produtos += geraProdutos(myReader, i);
                    ++i;
                }
                produtosVitrine.Text = produtos;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
            myConn.Close();

        }
        private string geraProdutos(MySqlDataReader myReaderCount, int i)
        {

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("<div class=\"py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4\" runat=\"server\">");
            sb.AppendLine("<a href=\"ProdutoDetalhe.aspx?Codigo=" + myReaderCount["codigo"].ToString()+ "\">");
            sb.AppendLine("<img id=\"imagemProduto" + i + "\" class=\"img-fluid\" alt=\"High Edu\" src=\"images/" + myReaderCount["codigo"].ToString() + ".png\">");
            sb.AppendLine("</a>");
            sb.AppendLine("<div class=\"informacoes py-2\"  runat=\"server\">");
            sb.AppendLine("<a class=\"botaocomprar\" title=\""+ myReaderCount["titulo"].ToString() + "\" href=\"ProdutoDetalhe.aspx?Codigo="+ myReaderCount["codigo"].ToString() + "\" runat=\"server\">");
            sb.AppendLine("<p class=\"produto\" runat=\"server\">"+ myReaderCount["titulo"].ToString() + "</p>");
            sb.AppendLine("</a>");
            sb.AppendLine("<div class=\"d-flex justify-content-center\">");
            sb.AppendLine("<h5 class=\"d-inline pr-4\" runat=\"server\">R$ "+ myReaderCount["valor"].ToString() + "</h5>");
            sb.AppendLine("<a class=\"d-inline btn btn-outline-dark btn-sm\" href=\"Cesta.aspx?Codigo="+ myReaderCount["codigo"].ToString() + "\" role=\"button\">Comprar</a>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            
            return sb.ToString();
        }
    }
}