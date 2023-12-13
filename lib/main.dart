import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        primaryColor: Colors.yellow,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        dividerTheme: const DividerThemeData(color: Colors.white24),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Crypto Currencies List'),
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            "assets/svg/bitcoin_logo.svg",
            height: 30,
            width: 30,
          ),
          title: Text(
            "Bitcoin",
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            "20000\$",
            style: theme.textTheme.labelSmall,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
