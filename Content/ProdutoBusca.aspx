<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProdutoBusca.aspx.cs" Inherits="ProjetoP2.Content.ProdutoBusca" %>

<!DOCTYPE html>
<html>
<head>
    <title>Projeto de Web - Fatec</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <nav class="nav navbar navbar-light bg-light">
            <a class="navbar-brand" href="Vitrine.aspx">
                <!-- Logo -->
                <img src="images/logo.png" id="imglogotopo" width="80">
            </a>
            <ul class="nav navbar ">
                <li class="navbar-item">
                        <a href="Login.aspx">Login <asp:Label ID="nomeLogado" runat="server"/>|</a>
                </li>
                <li class="navbar-item">
                    <button class="btn btn-light" type="button" >
                        <a href="Cesta.aspx">
                            <img src="images/24px.svg" id="imgcarrinho" width="30">
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
                                <a class="dropdown-item" href="Cadastro.aspx">Realize seu cadastro</a>
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
        <!-- busca -->
        <section id="product_search">
            <div class="container">
                <div class="name_search">
                    <p><h6>Pesquisa por: <asp:Label id="buscaProduto" runat="server"/>
                    </h6></p>
                </div>
                
                    
                <div class="row search_row">
                    <asp:Literal id="produtosBusca" runat="server"/>
<%--                
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="ProdutoDetalhe.aspx?Codigo=001">
                                    <asp:Image ID="imagemProduto1" runat="server"/>
                                </a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$<asp:Label id="valorProduto1" runat="server"/></h6>
                                    <p><asp:Label id="tituloProduto1" runat="server"/></p>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="produto-detalhe.aspx"><img src="images/sacada-roupas-femininas-inverno.png" alt=""></a>
                                <div class="pi-links">
                                    <a class="d-inline btn btn-light btn-outline-dark btn-sm" href="cesta.aspx" role="button">Comprar</a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <a href="produto-detalhe.aspx">
                                    <h6>R$670</h6>
                                    <p>Blusa de Lã - Cinza e Preta Softwave</p>
                                </a>
                            </div>
                        </div>
                    </div>--%>


                </div>
                <div id="search-pagination">
                    <ul class="pagination justify-content-end">
                      <li class="page-item active"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">Próximo</a></li>
                    </ul> 
                </div>
            </div>
            
        </section>
        <!--//busca-->
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
                                        <input class="form-control" type="email" name="Email" placeholder="Cadastre seu email..." required="" >
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

<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("search-pagination");
    var btns = header.getElementsByClassName("page-item");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function () {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>