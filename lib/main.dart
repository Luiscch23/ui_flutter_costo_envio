import 'package:cotizar1/presentation/view_models/datos_model.dart';
import 'package:cotizar1/presentation/view_models/screens/datos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/api_provider.dart';
import 'data/repositories/repositories.dart';
import 'domain/entities/uso_casos.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiProvider>(
          create: (_) => ApiProvider(),
        ),
        ProxyProvider<ApiProvider, DatosRepository>(
          update: (_, apiProvider, __) => DatosRepository(apiProvider),
        ),
        ProxyProvider<DatosRepository, ObtenerDatosUseCase>(
          update: (_, datosRepository, __) =>
              ObtenerDatosUseCase(datosRepository),
        ),
        ChangeNotifierProvider<DatosViewModel>(
          create: (_) => DatosViewModel(
            Provider.of<ObtenerDatosUseCase>(_, listen: false),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      home: DatosScreen(),
    );
  }
}
