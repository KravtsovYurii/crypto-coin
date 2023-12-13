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
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          iconTheme: IconThemeData(color: Colors.white),
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
      routes: {
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bitcoin_logo.svg",
              height: 30,
              width: 30,
            ),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              "20000\$",
              style: theme.textTheme.labelSmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(
                "/coin",
                arguments: coinName,
              );
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}
