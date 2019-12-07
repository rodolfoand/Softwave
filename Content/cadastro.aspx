﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="ProjetoP2.Content.Cadastro" %>

<!DOCTYPE html>
<html>

<head>
    <title>Projeto de Web - Fatec</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css" />
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

        <!-- Esqueci minha senha -->

        <div class="container">
            <div class="row d-flex justify-content-center bg-light">
                <aside class="col-sm-8 mt-4 mb-4">
                    <div class="card">
                        <article class="card-body">
                              <form>
                                        <div class="form-row">
                                            <h5>Cadastro</h5>
                                            <div class="col-md-12 mb-3">
                                                <label for="nome">Nome Completo</label>
                                                <input type="text" class="form-control" id="nome" placeholder="Nome" value="" runat="server">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label for="usuario">Email</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                                    </div>
                                                    <input name="" class="form-control" placeholder="soft@wave.com" type="email" id="usuario" runat="server">
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="senha1">Senha</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend2">#</span>
                                                    </div>
                                                    <input type="password" class="form-control" id="senha1" placeholder="******" aria-describedby="inputGroupPrepend2" runat="server">
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="senha2">Confirmação</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend2">#</span>
                                                    </div>
                                                    <input type="password" class="form-control" id="senha2" placeholder="******" aria-describedby="inputGroupPrepend2" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6 mb-3">
                                                <label for="cpf">CPF</label>
                                                <input type="text" class="form-control" id="cpf" placeholder="12345678901" value="" runat="server">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="telefone">Telefone</label>
                                                <input type="text" class="form-control" id="telefone" placeholder="11123456789" value="" runat="server">
                                            </div>
                                        </div>
                                  <!--
                                        <button class="btn btn-outline-dark" type="submit" onclick="validar2();">Enviar</button>
                                  -->
                                        <form runat="server">
                                        <asp:Button ID="ButtonEnviar" class="btn btn-outline-dark" Text="Enviar" OnClick="enviar" OnClientClick="validar2()" runat="server"/>
                                            <asp:Label id="lblMensagem" runat="server"/>
                                        </form>
                                    </form>
                        </article>
                    </div>
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

<script language="javascript">
    function validar2() {

        //Validações do Modal
        //validação do nome
        if (nome.value.length < 3 || isNaN(nome.value) == false) { //tamanho minimo 3 ou isNaN = false pra evitar numeros
            alert("Informe o nome completo !");
            nome.focus(); // foca no campo com id nome
            return false;
        }
        //validação do email
        // a@a.co   tamanho minimo
        // 012345
        if (usuario.value.length < 6 || // tamanho minimo do email   
            usuario.value.indexOf("@") < 1 || // mostra a posição do @
            usuario.value.lastIndexOf(".") <= usuario.value.indexOf("@") || // se a posição do ponto for <= a posição do @
            usuario.value.lastIndexOf(".") == (usuario.value.length - 1)
        ) {
            alert("Informe um email válido");
            usuario.focus(); // foca no campo com id email
            return false;
        }
        //validação da senha
        if (senha1.value.length < 6) {
            alert("Informe uma senha com no mínimo 6 digitos !");
            senha1.focus(); // foca no campo com id senha1
            return false;
        }
        if (senha1.value != senha2.value) {
            alert("Senha e confirmação estão diferentes");
            senha2.focus(); // foca no campo com id senha2
            return false;
        }
        //validação CPF
        if (cpf.value.length < 11 || isNaN(cpf.value)) {
            alert("Informe um CPF válido (11 algarismos, sem ponto e hifen)");
            cpf.focus();
            return false;
        }
        //validação telefone
        if (telefone.value.length < 10 || isNaN(telefone.value)) {
            alert("Informe um telefone com DDD");
            telefone.focus();
            return false;
        } else {
            //alert("Cadastro realizado com sucesso !!!");
        }
    }
</script>

