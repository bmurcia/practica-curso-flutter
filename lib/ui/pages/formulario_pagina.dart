
import 'package:flutter/material.dart';
import 'package:flutter_app_equipo4_q4_24/ui/pages/segunda_pagina.dart';

class FormularioPagina extends StatefulWidget {
  const FormularioPagina({super.key});


  @override
  State<StatefulWidget> createState() {
    return FormularioPaginaState();
  }
}

class FormularioPaginaState extends State<FormularioPagina>{
  final _formkey = GlobalKey<FormState>();

  List<String> campus = ['Unitec SPS','Ceutec Central','Ceutec Norte'];

  //textField
  late TextEditingController _controller;
  late TextEditingController _controller2;

  late bool seleccionado;
  late String carrera;

  late String? sede;


  @override
  void initState() {
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    seleccionado = false;
    carrera = '';
    sede = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ej. Bryan',
                label: Text("Nombre Completo")  
              ),
              validator: (value){
                if (value==null || value.isEmpty || value ==''){
                  return "El campo nombre es obligatorio";
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: _controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ej. 10',
                label: Text('Edad')
              ),
              validator: (value){
                if( value==null || value.isEmpty || value==''){
                  return 'El campo edad es obligatorio';
                }
                return null;
              },
            ),
            ListTile(
              title: const Text("Eres nuevo en la institucion?"),
              subtitle: const Text("Selecciona si eres nuevo estudiante"),
              leading: Checkbox(
                value: seleccionado,
                onChanged: (value){
                  //actualizar el estado
                  setState(() {
                    if (value != null){
                      seleccionado = value;
                    }
                  });
                },
              ),
            ),
            const Text("Selecciona tu carrera"),
            ListTile(
              title: const Text("Informática"),
              trailing: Radio(
                groupValue: carrera,
                value: "Informatica",
                onChanged: (value) {
                  setState(() {
                    if(value != null){
                      carrera = value;
                    }
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Electronica"),
              trailing: Radio(
                groupValue: carrera,
                value: 'Electronica',
                onChanged:(value) {
                  setState(() {
                    if(value != null){
                      carrera = value;
                    }
                  });
                },
              ),
            ),
            const Text("Selecciona tu sede"),
            DropdownButton<String>(
              value: sede,
              items: campus.map<DropdownMenuItem<String>>((String item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? value){
                setState(() {
                  if (value != null){
                    sede =value;
                  }
                });
              },
            ),
            Row(
              children: [
                TextButton(
                  child: const Text("Validar"),
                  onPressed: () {
                    if (_formkey.currentState!.validate()){
                      if (carrera == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Debes seleccionar una carrera") 
                          )
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Formulario validado correctamente")
                          )    
                        );
                      }
                    }
                  },
                ),
                const SizedBox(width: 8,),
                OutlinedButton(
                  child: const Text("Segundo"),
                  onPressed: (){},
                ),
                const SizedBox(width: 8,),
                ElevatedButton(
                  child: const Text("Tercero"),
                  onPressed: (){
                    Navigator.pushNamed(context, 'segunda_pagina');
                    //Navigator.push(context, 
                      //MaterialPageRoute(
                        //builder: (context) => const SegundaPagina()
                      //)
                    //);
                  },
                ),

                const SizedBox(width: 8,),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(4),

                    ),
                    child: const Text("Cuarto"),
                  ),
                  onTap:() {
                    print("Texto presionado");
                  },
                  onLongPress: () {
                    print("Presionado Largo");
                  },
                  onDoubleTap: () {
                    print("Doble presionado");
                  },
                )


              ],
            )
          ],
        ) 
      ),
    );

  }

  
}