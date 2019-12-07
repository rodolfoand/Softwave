<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vitrine.aspx.cs" Inherits="ProjetoP2.Content.Vitrine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Projeto de Web - Fatec</title>

        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/estilo.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>

    <body runat="server">
        <div class="container">
            <nav class="nav navbar navbar-light bg-light">
                <a class="navbar-brand" href="Vitrine.aspx">
                    <!-- Logo -->
                    <img src="images/logo.png" id="imglogotopo" width="80"/>
                </a>
                <ul class="nav navbar ">
                    <li class="navbar-item">
                        <a href="Login.aspx">Login <asp:Label ID="nomeLogado" runat="server"/>|</a>
                    </li>
                    <li class="navbar-item">
                        <button class="btn btn-light" type="button" >
                            <a href="Cesta.aspx">
                                <img src="images/24px.svg" id="imgcarrinho" width="30"/>
                            </a>
                        </button>
                    </li>
                </ul>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light">
                <!--botão collapse-->
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarSite">
                    <span class="navbar-toggler-icon "></span>
                </button>

                <!--Menu-->
                <div class="collapse navbar-collapse" id="navbarSite">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="navbar-item">
                            <a class="nav-link" href="Vitrine.aspx">Home</a>
                        </li>

                        <!-- Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                Produtos
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="Vitrine.aspx">Blusas</a>
                                <a class="dropdown-item" href="Vitrine.aspx">Calças</a>
                                <a class="dropdown-item" href="Vitrine.aspx">Vestidos</a>
                                <a class="dropdown-item" href="Vitrine.aspx">Saias</a>
                                <a class="dropdown-item" href="Vitrine.aspx">Shorts</a>
                                <a class="dropdown-item" href="Vitrine.aspx">Acessórios</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sobre Nós</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                Cadastro
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="cadastro.aspx">Realize seu cadastro</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contato</a>
                        </li>
                    </ul>
                    <div class="col-lg-4 col-md-3 col-sm-3 col-12">
                        <div class="float-right">
                            <form class="form-inline" action="ProdutoBusca.aspx">
                                <div>
                                    <input class="form-control" type="search" placeholder="Procurar..." name="search" id="mySearch" required>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-dark" onclick="doSearch()"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="ws_carousel" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#ws_carousel" data-slide-to="0" class="active"></li>
                <li data-target="#ws_carousel" data-slide-to="1"></li>
                <li data-target="#ws_carousel" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="d-block w-100" src="images/cabides1.jpeg" alt="First slide">
                  <div class="carousel-caption d-none d-md-block">
                    
                  </div>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="images/deitadas.jpeg" alt="Second slide">
                  <div class="carousel-caption d-none d-md-block">
                    
                  </div>
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="images/cabides2.jpeg" alt="Third slide">
                  <div class="carousel-caption d-none d-md-block">
                    
                  </div>
                </div>
              </div>
              <a class="carousel-control-prev" href="#ws_carousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#ws_carousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
                
            </div>
            <!-- produtos -->
            <section id="galeria" runat="server">
                <div class="container" runat="server">
                    
                    <div class="row news-grids pb-lg-5 text-center" runat="server">
                        <asp:Literal id="produtosVitrine" runat="server"/>
                        <!--
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4" runat="server">
                            <a href="ProdutoDetalhe.aspx?Codigo=001">
                                <asp:Image ID="imagemProduto1" runat="server" alt="High Edu" class="img-fluid"/>
                            </a>
                            <div class="informacoes py-2 "  runat="server">
                            	<a class="botaocomprar" title="Blusa de lã - Cinza e Preta Softwave" href="ProdutoDetalhe.aspx?Codigo=001" runat="server">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto1" runat="server"/></p>
                                    
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto1" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=001" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4">
                            <a href="ProdutoDetalhe.aspx?Codigo=002">
                                <asp:Image ID="imagemProduto2" runat="server" alt="High Edu" class="img-fluid"/>

                            </a>
                            <div class="informacoes bg-light py-2 " >
                                <a class="botaocomprar" title="Blusa de Malha - Vermelha Softwave" href="ProdutoDetalhe.aspx?Codigo=002">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto2" runat="server"/></p>   
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto2" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=002" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4">
                            <a href="ProdutoDetalhe.aspx?Codigo=003">
                                <asp:Image ID="imagemProduto3" runat="server" alt="High Edu" class="img-fluid"/>
                            </a>
                            <div class="informacoes bg-light py-2 " >
                                <a class="botaocomprar" title="Regatinha Furinhos- Azul Softwave" href="ProdutoDetalhe.aspx?Codigo=003">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto3" runat="server"/></p>   
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto3" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=003" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4">
                            <a href="ProdutoDetalhe.aspx?Codigo=004">
                                <asp:Image ID="imagemProduto4" runat="server" alt="High Edu" class="img-fluid"/>
                            </a>
                            <div class="informacoes bg-light py-2 " >
                                <a class="botaocomprar" title="Calça estampada Softwave" href="ProdutoDetalhe.aspx?Codigo=004">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto4" runat="server"/></p>   
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto4" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=004" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4">
                            <a href="ProdutoDetalhe.aspx?Codigo=005">
                                <asp:Image ID="imagemProduto5" runat="server" alt="High Edu" class="img-fluid"/>
                            </a>
                            <div class="informacoes bg-light py-2 " >
                                <a class="botaocomprar" title="Shorts Alfaiataria - Caqui Softwave" href="ProdutoDetalhe.aspx?Codigo=005">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto5" runat="server"/></p>   
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto5" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=005" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="py-2 col-sm-12 col-md-4 col-lg-4 col-xs-12 gal-img mt-lg-4">
                            <a href="ProdutoDetalhe.aspx?Codigo=006">
                                <asp:Image ID="imagemProduto6" runat="server" alt="High Edu" class="img-fluid"/>
                            </a>
                            <div class="informacoes bg-light py-2 " >
                                <a class="botaocomprar" title="Macacão estampado - Preto Softwave" href="ProdutoDetalhe.aspx?Codigo=006">
                                    <p class="produto" runat="server"><asp:Label id="tituloProduto6" runat="server"/></p>   
                                </a>
                                <div class="d-flex justify-content-center"> 
                                    <h5 class="d-inline pr-4" runat="server">R$ <asp:Label id="valorProduto6" runat="server"/></h5>  
                                    <a class="d-inline btn btn-outline-dark btn-sm" href="Cesta.aspx?Codigo=006" role="button">Comprar</a>
                                </div>
                            </div>
                        </div>
                        -->
                    </div>
                </div>
            </section>
            <!--//produtos-->
        </div>
        <div class="container">
            <!-- //footer -->
            <footer>
                <section class="footer footer_1its py-5">
                    <div class="container py-md-4">
                        <div class="row footer-top mb-md-5 mb-4">
                            <div class="col-lg-4 col-md-7 footer-grid_section_1its">
                                <div class="footer-title-w3ls">
                                    <h3>Endereço</h3>
                                </div>
                                <div class="footer-text">
                                    <p class="m-0">Endereço : Oscar Freire, 1000, São Paulo - SP</p>
                                    <p class="m-0">Telefone : 11 5348-9436</p>
                                    <p class="m-0">Email : <a href="mailto:softwave@softwave.com">softwave@softwave.com</a></p>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-5 mt-lg-0 mt-4 col-sm-12 footer-grid_section_1its">
                                <div class="footer-title-w3ls">
                                    <h3>Últimas Notícias</h3>
                                </div>
                                <div class="footer-text">
                                    <p> Inscreva-se para receber as ofertas especiais, toda semana uma promoção especial para você</p>
                                    <form action="#" method="post" class="form-inline">
                                        <input class="form-control" type="email" name="Email" placeholder="Cadastre seu email..." required="" style="width: 83%;" >
                                        <button class="btn btn-dark"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </footer>
            <!-- //footer -->
        </div>  
    </body>
</html>
