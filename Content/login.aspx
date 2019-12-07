<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjetoP2.Content.Login" %>

<!DOCTYPE html>
<html>

<head>
    <title>Projeto de Web - Fatec</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/estilo.css"/>
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
                    <button class="btn btn-light" type="button">
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

        <!-- Login -->

        <div class="container">
            <div class="row d-flex justify-content-center bg-light">
                <aside class="col-sm-6 mt-4 mb-4">
                    <div class="card">
                        <article class="card-body">
                            <h5>Fazer Login</h5>
                            <form>
                                <div class="form-group">
                                    <label>Seu email</label>
                                    <input name="" class="form-control" placeholder="Email" type="email" id="email" runat="server">
                                </div>
                                <!-- form-group// -->
                                <div class="form-group">
									
                                    <label>Sua senha</label>
                                    <input class="form-control" placeholder="******" type="password" id="senha" runat="server">
                                </div>
                                <!-- form-group// -->
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox"> Salvar senha </label><br/>
                                    </div>
                                    <a class="" href="Esqueci.aspx"> Esqueceu sua senha? </a>
                                    <!-- checkbox .// -->
                                </div>
                                <!-- form-group// -->
                                <form runat="server">
                                <div class="form-group">
                                    <!--
                                    <button type="submit" class="btn btn-outline-dark btn-block" onclick="validar();"> Entrar </button>
                                    -->
                                    <asp:Button ID="ButtonEntrar" class="btn btn-outline-dark btn-block" Text="Entrar" OnClick="entrar" OnClientClick="validar()" runat="server"/>
								<!--	<a href="esqueci.aspx" class="btn btn-secondary btn-block">Esqueceu sua senha?</a> -->
									<a href="Cadastro.aspx" class="btn btn-dark btn-block">Não tenho cadastro</a>
                                    <asp:Label id="lblMensagem" runat="server"/>
                                </div>
                                </form>
                                <!-- form-group// -->
                            </form>
                        </article>
                    </div>
                </aside>
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
                                <div class="footer-text" align="justify-content-center">
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
    </div>
</body>

</html>

<script language="javascript">
    function validar() {
        //validação do email
        // a@a.co   tamanho minimo
        // 012345
        if (email.value.length < 6 || // tamanho minimo do email 
            email.value.indexOf("@") < 1 || // mostra a posição do @
            email.value.lastIndexOf(".") <= email.value.indexOf("@") || // se a posição do ponto for <= a posição do @
            email.value.lastIndexOf(".") == (email.value.length - 1)
        ) {
            alert("Informe um email válido");
            email.focus(); // foca no campo com id email
            return false;
        }
        //validação da senha
        if (senha.value.length < 6) {
            alert("Informe uma senha com no mínimo 6 dígitos !");
            senha.focus(); // foca no campo com id senha1
            return false;
        }
    }
</script>
<%--  --%>