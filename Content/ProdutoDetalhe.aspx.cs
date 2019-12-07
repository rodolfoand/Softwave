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
    public partial class ProdutoDetalhe : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=fatec;Uid=root;Pwd=;";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            String codigo = Request.QueryString["Codigo"];
            carregarTela(codigo);

            if (Session["nomeCliente"] != null)
            {
                nomeLogado.Text = " (" + Session["nomeCliente"].ToString() + ")";
            }
        }
        private void carregarTela(String codigo)
        {
            MySqlConnection myConn = new MySqlConnection(sc);
            MySqlCommand command = myConn.CreateCommand();
            command.CommandText = "select * from produto where codigo = "+codigo+" order by codigo limit 1";
            MySqlDataReader myReader;

            int i = 1;

            try
            {
                myConn.Open();
                myReader = command.ExecuteReader();

                while (myReader.Read())
                {
                    Label tituloProduto = this.FindControl("tituloProduto") as Label;
                    tituloProduto.Text = myReader["titulo"].ToString();

                    Label valorProduto = this.FindControl("valorProduto") as Label;
                    valorProduto.Text = myReader["valor"].ToString();

                    Label disponibilidadeProduto = this.FindControl("disponibilidadeProduto") as Label;
                    if (int.Parse(myReader["qtd"].ToString()) > 0)
                    {
                        disponibilidadeProduto.Text = "Em Estoque";
                    } else
                    {
                        disponibilidadeProduto.Text = "Indisponível";
                    }
                    
                    Label descritivoProduto = this.FindControl("descritivoProduto") as Label;
                    descritivoProduto.Text = myReader["descritivo"].ToString();

                    Image imagemProduto = this.FindControl("imagemProduto") as Image;
                    imagemProduto.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";
                    imagemProdutoT1.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";
                    imagemProdutoT2.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";
                    imagemProdutoT3.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";
                    imagemProdutoT4.ImageUrl = "images/" + myReader["codigo"].ToString() + ".png";

                    cestaProduto.Text = "<a class=\"d - inline btn btn-light btn - outline - dark btn - sm\" href=\"Cesta.aspx?Codigo="+ myReader["codigo"].ToString() + "\" role=\"button\" OnClick=\"sessionCesta\" > Comprar</a>";

                    ++i;
                }
            }
            catch (Exception ex){}
            myConn.Close();

        }
        
        protected void sessionCesta(object sender, EventArgs e)
        {
            Comprar();
        }

        private void Comprar()
        {
            try
            {
                if (Session["ID"] != null)
                {
                    Session["ID"] = Guid.NewGuid().ToString();
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}