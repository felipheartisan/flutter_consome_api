import 'package:flutter/material.dart';

class HelperWidgets{

  //Cria uma janela de diálogo para exibir uma mensagem simples
  static Future<void> showMessageDialog(String mensagem, BuildContext context) {      
      return showDialog(context: context, 
        builder: (context) {
          return AlertDialog(title: const Text("Aviso"),
            content: Text(mensagem),
            actions: [
              TextButton(onPressed: () {
                //Fecha a janela de diálogo
                Navigator.of(context).pop();
              }, child: const Text("OK"))
            ],            
            );
            },        
        );
  }

  /**
   * Utilizado para criar um campo do tipo TextFormField para utilizado
   * no Widget Form. O componente TextFormField e envolvido pelo Widget
   * Flexible.
   */
  static Widget createTextForm(String label, String? msgValidator, 
        TextEditingController controller){
    return Flexible(child: 
              TextFormField(
                controller: controller,
                decoration: InputDecoration(label: Text(label)),
                validator: (value) {
                  if (value != null && value.trim().isEmpty){
                     return msgValidator ?? "Campo obrigatório!";
                  } 
                },
              ), 
           );
  }

}