import 'package:flutter/material.dart';
import 'models/professional.dart';
import 'services/professional_service.dart';
import 'widgets/professional_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Serviços',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfessionalListScreen(),
    );
  }
}

class ProfessionalListScreen extends StatefulWidget {
  @override
  _ProfessionalListScreenState createState() => _ProfessionalListScreenState();
}

class _ProfessionalListScreenState extends State<ProfessionalListScreen> {
  final ProfessionalService _service = ProfessionalService();
  late Future<List<Professional>> _professionals;

  @override
  void initState() {
    super.initState();
    _professionals = _service.fetchProfessionals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profissionais Disponíveis'),
      ),
      body: FutureBuilder<List<Professional>>(
        future: _professionals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar profissionais.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum profissional encontrado.'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((professional) => ProfessionalCard(professional: professional))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
