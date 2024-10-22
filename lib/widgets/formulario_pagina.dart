
import 'package:flutter/material.dart';

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
        child: ListView(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ej. Bryan',
                label: Text("Nombre Completo")  
              ),
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
                  return 'El valor es obligatorio';
                }
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
                  child: const Text("Primero"),
                  onPressed: () {},
                ),
                const SizedBox(width: 8,),
                OutlinedButton(
                  child: const Text("Segundo"),
                  onPressed: (){},
                ),
                const SizedBox(width: 8,),
                ElevatedButton(
                  child: const Text("Tercero"),
                  onPressed: (){},
                ),

                const SizedBox(width: 8,),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
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