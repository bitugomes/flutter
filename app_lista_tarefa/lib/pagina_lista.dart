import 'package:app_lista_tarefa/modelo/objeto_data_hora.dart';
import 'package:app_lista_tarefa/widgets/itens_lista.dart';
import 'package:flutter/material.dart';

class Pagina_lista extends StatefulWidget {
  @override
  State<Pagina_lista> createState() => _Pagina_listaState();
}

class _Pagina_listaState extends State<Pagina_lista> {
  final TextEditingController mensagensControlador = TextEditingController();

  List<Data_Hora> Mensagens = [];
  Data_Hora? deletar_itens;
  int? posicao_atual_deletar;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mensagensControlador,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicione uma tarefa",
                          hintText: "Digite aqui"),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String qualquercoisa = mensagensControlador.text;

                      setState(() {
                        Data_Hora item_data_hora = Data_Hora(
                            titulo: qualquercoisa, data_hora: DateTime.now());
                        Mensagens.add(item_data_hora);
                      });

                      mensagensControlador.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ffa00),
                        padding: EdgeInsets.all(20)),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Data_Hora mensagem_controle in Mensagens)
                      TudoItemLista(
                        mensagem_data_hora: mensagem_controle,
                        item_deletar_tarefas: deletar_tarefas,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        "Você possui ${Mensagens.length} tarefas pendentes"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mensagem_confimacao();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ffa00),
                        padding: EdgeInsets.all(20)),
                    child: Text("Limpar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deletar_tarefas(Data_Hora item_data_hora) {
    deletar_itens = item_data_hora;
    posicao_atual_deletar = Mensagens.indexOf(item_data_hora);
    setState(() {
      Mensagens.remove(item_data_hora);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Tarefa ${item_data_hora.titulo} foi removida com sucesso",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Color.fromARGB(255, 0, 36, 107),
        action: SnackBarAction(
          textColor: Colors.green,
          label: "Desfazer",
          onPressed: () {
            Mensagens.insert(posicao_atual_deletar!, deletar_itens!);
          },
        ),
      ),
    );
  }

  void mensagem_confimacao() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Limpar tudo?"),
          content: Text("Você tem certeza que deseja apagar todas as tarefas?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  Mensagens.clear();
                });
              },
              child: Text("Limpar tudo"),
            ),
          ],
        );
      },
    );
  }
}
