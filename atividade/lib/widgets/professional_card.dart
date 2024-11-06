import 'package:flutter/material.dart';
import '../models/professional.dart';

class ProfessionalCard extends StatelessWidget {
  final Professional professional;

  ProfessionalCard({required this.professional});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(professional.name),
        subtitle: Text(
          'Avaliação: ${professional.rating.toStringAsFixed(1)} - R\$ ${professional.pricePerHour}/hora',
        ),
      ),
    );
  }
}