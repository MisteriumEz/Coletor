import 'package:coletor_nativo/controller/user_controller.dart';
import 'package:flutter/material.dart';

//Cria as variavéis para o teste da edição
class CadastroEdita extends StatefulWidget {
  final codigo_barras codbarra;
  CadastroEdita({required this.codbarra});

  @override
  _CadastroEditaState createState() => _CadastroEditaState();
}

class _CadastroEditaState extends State<CadastroEdita> {
  final _editaNomeProduto = TextEditingController();
  final _editaCodigoProduto = TextEditingController();
  final _editaQuantidadeProduto = TextEditingController();

  late String title;
  bool editando = false;

  late codigo_barras _editaCodBarra;

  //Persistência para ver se o código é nulo ou já existente para habilitar a edição.
  @override
  void initState() {
    super.initState();
    if (widget.codbarra == null) {
      _editaCodBarra = codigo_barras(0, "", 0, "");
    } else {
      _editaCodBarra = codigo_barras.fromMap(widget.codbarra.toMap());
      _editaNomeProduto.text = _editaCodBarra.nome;
      _editaCodigoProduto.text = _editaCodBarra.codigo;
      _editaQuantidadeProduto.text = _editaCodBarra.quantidade.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_editaCodBarra.nome == ""
              ? "Cadastro de Produto"
              : "Editar Produto"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _editaNomeProduto,
                decoration: InputDecoration(labelText: "Nome"),
                enabled: true,
                onChanged: (text) {
                  editando = true;
                  _editaCodBarra.nome = text;
                },
              ),
              TextField(
                controller: _editaCodigoProduto,
                decoration: InputDecoration(labelText: "Código"),
                enabled: false,
              ),
              TextField(
                controller: _editaQuantidadeProduto,
                decoration: InputDecoration(labelText: "Quantidade"),
                enabled: false,
              ),
            ],
          ),
        ));
  }
}