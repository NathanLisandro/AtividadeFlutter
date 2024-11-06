import 'package:flutter_test/flutter_test.dart';
import '../lib/models/professional.dart';

void main() {
  test('Calcular preço total do serviço', () {
    final professional = Professional(id: 1, name: 'Luis', rating: 3.4, pricePerHour: 25);
    final hours = 3;
    final totalPrice = professional.pricePerHour * hours;

    expect(totalPrice, 75); 
  });
}