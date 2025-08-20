import 'package:dropdown_test/services/selector_service.dart';
import 'package:dropdown_test/view_models/selector_view_model.dart';
import 'package:dropdown_test/views/selector_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => SelectorService()),
        ChangeNotifierProvider(
          create: (ctx) =>
              SelectorViewModel(ctx.read<SelectorService>())..getCountries(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SelectorScreen());
  }
}
