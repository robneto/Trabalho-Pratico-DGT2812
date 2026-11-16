import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo - Agência de Viagens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Passo 5: Seção de Título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Lago Oeschinen - Pacote Alpino',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Suíça',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const SizedBox(width: 4),
          const Text('4.9 (41)'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // Passo 6: Seção de Botões (com feedback visual ao clicar)
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
          context,
          color,
          Icons.call,
          'CONTATO',
          'Ligando para a central de reservas Explore Mundo...',
        ),
        _buildButtonColumn(
          context,
          color,
          Icons.near_me,
          'ROTA',
          'Abrindo rota para Kandersteg, Suíça no mapa...',
        ),
        _buildButtonColumn(
          context,
          color,
          Icons.share,
          'COMPARTILHAR',
          'Link do pacote copiado para compartilhamento!',
        ),
      ],
    );

    // Passo 7: Seção de Texto
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. '
        'Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos '
        'mais amplos. Um passeio de teleférico a partir de Kandersteg, seguido '
        'por meia hora de caminhada por pastagens e floresta de pinheiros, '
        'leva você ao lago, que aquece até 20 graus Celsius no verão. '
        'As atividades desfrutadas aqui incluem remo e andar no tobogã de verão.\n\n'
        'Consulte condições de reserva com a equipe Explore Mundo.',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo - Destinos'),
      ),
      // Passo 9: ListView para rolagem em dispositivos menores
      body: ListView(
        children: [
          // Passo 8: Imagem de destaque
          Image.asset(
            'images/destino.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  // Método auxiliar para construir cada coluna de botão interativa
  Widget _buildButtonColumn(
    BuildContext context,
    Color color,
    IconData icon,
    String label,
    String mensagemFeedback,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensagemFeedback),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}