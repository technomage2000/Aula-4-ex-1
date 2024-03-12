import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _controlaNome = TextEditingController();
  final TextEditingController _controlaNota = TextEditingController();
  String _resultado = ' ';

  void _calculaResultado() {
    var nota = double.tryParse(_controlaNota.text);

    setState(() {
      if (nota != null) {
        if (nota >= 6.0) {
          _resultado = '${_controlaNome.text} foi aprovado!';
        } else {
          _resultado = '${_controlaNome.text} foi reprovado.';
        }
      } else {
        _resultado = ' ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado final:'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Nome:'),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controlaNome,
                  onChanged: null,
                  //print(_nome);
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Nota:'),
              SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controlaNota,
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _calculaResultado();
              },
              child: const Text('Resultado')),
          Row(
            children: [
              Text('$_resultado'),
            ],
          ),
        ],
      ),
    );
  }
}
