﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cesta.aspx.cs" Inherits="ProjetoP2.Content.Cesta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml>
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

    <body runat="server">
        <div class="container" runat="server">
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
                            <img src="images/24px.svg" alt="carrinho" id="imgcarrinho" width="30">
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
            <div class="minhas-compras bg-light mt-4">
                <h5>Meu Carrinho</h5>
            </div>
            <div class="cart">
                <table class="table cart-item">
                    <thead>
                        <tr class="titulo-tabela">
                            <th class="produto">Produto</th>
                            <th class="preco-item">Preço</th>
                            <th class="quantidade-item">Qtde</th>
                            <th class="valor-total">Valor</th>
                        </tr>
                    </thead>
                    <!--
                        <tbody>
                            <td class="produto ">Blusa vermelha</td>
                            <td class="preco-item">R$ 100.00</td>
                            <td class="quantidade-item">2</td>
                            <td class="valor-total ">R$ 200.00</td>
                        </tbody>
                         <tbody>
                            <td class="produto ">Blusa Azul</td>
                            <td class="preco-item">R$ 100.00</td>
                            <td class="quantidade-item">1</td>
                            <td class="valor-total">R$ 100.00</td>
                        </tbody>
                    -->
                        <asp:Literal id="produtosCesta" runat="server"/>
                </table>
            </div>
            <div class="d-flex flex-row bd-highlight mb-3" runat="server">
                <div class="cart resume col-md-4">
                    <table>
                        <tbody>
                            <td class="subtotal py-2">Subtotal</td>
                            <td class="subtotal ">R$ <asp:Label id="valorSubtotal" runat="server"/></td>
                        </tbody>
                        <tbody><td class="espaço "></td></tbody>
                        <tbody>
                            <td class="subtotal py-2">Entrega</td>
                            <td class="subtotal ">R$ 20.00</td>
                        </tbody>
                        <tbody><td class="espaço "></td></tbody>
                        <tbody>
                        <tbody>
                            <td class="subtotal py-2">Total</td>
                            <td class="subtotal ">R$ <asp:Label id="valorTotal" runat="server"/></td>
                        </tbody>
                    </table>
                </div>
                <div class="text-center py-2" runat="server">
                    <form runat="server">
                    <div class="form-group ml-4 mt-2" runat="server">
                        <asp:Button ID="ButtonLimp" class="btn btn-dark" Text="Limpar Cesta" OnClick="limparCesta" runat="server"/>
                    </div>
                    <div class="form-group ml-4 mt-2">
                        <button type="submit" class="btn btn-dark" disabled> Finalizar Compras </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container">
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