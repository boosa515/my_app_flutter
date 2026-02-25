import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jornada Interativa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TonhoStoryPage(),
    );
  }
}

class TonhoStoryPage extends StatefulWidget {
  const TonhoStoryPage({super.key});

  @override
  State<TonhoStoryPage> createState() => _TonhoStoryPageState();
}

class _TonhoStoryPageState extends State<TonhoStoryPage> {
  int _step = 0;

  final List<String> _storyBeats = [
    "Gabriel está apenas começando sua jornada.",
    "O foco agora é terminar a graduação em Engenharia da Computação.",
    "Buscando opções de bolsas de estudo para ir mais longe...",
    "Gabriel está sonhando com um mestrado...",
    "...ou talvez uma pós-graduação!",
    "Escrevendo sua própria história, um passo de cada vez."
  ];

  void _nextStep() {
    setState(() {
      _step = (_step + 1) % _storyBeats.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Diário do Gabriel'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book,
                size: 80,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 30),
              Text(
                'Capítulo ${_step + 1}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 217, 212),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  _storyBeats[_step],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _nextStep,
        icon: const Icon(Icons.arrow_forward),
        label: const Text('Avançar'),
      ),
    );
  }
}