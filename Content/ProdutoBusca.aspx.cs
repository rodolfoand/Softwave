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
    public partial class ProdutoBusca : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        String produtos = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            String pesquisa = Request.QueryString["Search"];
            buscaProduto.Text = pesquisa;
            carregarTela(pesquisa);

            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }
        private void carregarTela(String pesquisa)
        {
            MySqlConnection myConn = new MySqlConnection(sc);
            
            MySqlCommand commandCount = myConn.CreateCommand();
            commandCount.CommandText = "select * from produto where titulo like \"%" + pesquisa + "%\" order by codigo limit 8";
            MySqlDataReader myReaderCount;

            try
            {
                int i = 1;

                myConn.Open();

                myReaderCount = commandCount.ExecuteReader();
                while (myReaderCount.Read())
                {
                    produtos += geraProdutos(myReaderCount, i);
                    ++i;
                }
                produtosBusca.Text = produtos;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
            myConn.Close();

        }

        
        private string geraProdutos(MySqlDataReader myReaderCount,int i)
        {

            StringBuilder sb = new StringBuilder();

            //sb.AppendLine("<div class=\"row search_row\">");
            sb.AppendLine("");
            sb.AppendLine("<div class=\"col-lg-3 col-sm-6\">");
            sb.AppendLine("<div class=\"product-item\">");
            sb.AppendLine("<div class=\"pi-pic\">");
            sb.AppendLine("<a href = \"ProdutoDetalhe.aspx?Codigo="+ myReaderCount["codigo"].ToString() + "\">");
            sb.AppendLine("<img id=\"imagemProduto"+i+"\" src=\"images/"+ myReaderCount["codigo"].ToString() + ".png\">");
            sb.AppendLine("</a>");
            sb.AppendLine("<div class=\"pi-links\">");
            sb.AppendLine("<a class=\"d-inline btn btn-light btn-outline-dark btn-sm\" href=\"Cesta.aspx?Codigo="+ myReaderCount["codigo"].ToString() + "\" role=\"button\">Comprar</a>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            sb.AppendLine("<div class=\"pi-text\">");
            sb.AppendLine("<a href = \"ProdutoDetalhe.aspx?Codigo=" + myReaderCount["codigo"].ToString() + "\" >");
            sb.AppendLine("<h6 > R$ <span id=\"valorProduto" + i+"\">"+ myReaderCount["valor"].ToString() + "</span> </h6>");
            sb.AppendLine("<p><span id=\"tituloProduto"+i+"\">"+ myReaderCount["titulo"].ToString() + "</span></p>");
            sb.AppendLine("</a>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");

            return sb.ToString();
        }
    }
}