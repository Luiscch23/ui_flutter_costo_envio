import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../datos_model.dart';

class DatosScreen extends StatelessWidget {
  bool inicio = true;
  @override
  Widget build(BuildContext context) {
    final datosViewModel = Provider.of<DatosViewModel>(context);

    if (inicio == true) {
      datosViewModel.obtenerDatos();
      inicio = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
      ),
      body: Center(
        child: datosViewModel.datos != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Origen: ${datosViewModel.datos!.origen}'),
                  Text('Destino: ${datosViewModel.datos!.destino}'),
                  Text('Distancia: ${datosViewModel.datos!.distancia} km'),
                  Text('Tiempo: ${datosViewModel.datos!.tiempo} minutos'),
                  Text('Precio: ${datosViewModel.datos!.precio}'),
                ],
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          datosViewModel.obtenerDatos();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
