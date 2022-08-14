import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  // Imagem que vai ser escolhida pelo App.
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  // Detectar qual a opção o usuário selecionou
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      default:
    }

    // Validação do ganhador
    // Usuário ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Ganhou :)";
      });
    }
    // App Ganhador
    else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Perdeu :(";
      });
    }
    // Empate
    else {
      setState(() {
        this._mensagem = "Empate!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imagemApp,
            height: 140,
          ),
          /* Gesture Detector
           * Classe que irá detectar se há toque na tela.          
          GestureDetector(
            onTap: () {
              print("Um clique na imagem");
            },
            onDoubleTap: () {
              print("Dois cliques na imagem");
            },
            onLongPress: () {
              print("Clique longo na imagem");
            },
            child: Image.asset("images/padrao.png"),
          ),
          */
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /* // Esse trecho será substituido pelo GestureDetector
              Image.asset('images/pedra.png', height: 100),
              Image.asset('images/papel.png', height: 100),
              Image.asset('images/tesoura.png', height: 100),
              */

              GestureDetector(
                /* () => : Usarei este tipo de função anônima para sair o erro,
                 * pois minha função opcaoSelecionada é um void e não retorna nada.
                */
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('images/tesoura.png', height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
