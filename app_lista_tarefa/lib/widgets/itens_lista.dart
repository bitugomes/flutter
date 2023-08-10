import 'package:app_lista_tarefa/modelo/objeto_data_hora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_';

  class tudoItemLista extends StatelessWidget{
    const tudoItemLista({super.key, required this.mensagem_data_hora});
    final Data_Hora mensagem_data_hora;
  
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            Flex 2,
            onpressed: null, 
            backgroundColor: Colors.redAccent[400],
            foregroundColor: Colors.white,),
            Icon: Icon.delete,
            label:
          )  
        ],
      ),
  },
}
