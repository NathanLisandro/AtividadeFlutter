import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../lib/models/professional.dart';
import '../lib/services/professional_service.dart';

@GenerateMocks([ProfessionalService])

import 'professional_service_mock_test.mocks.dart';

void main() {
  test('Filtrar profissionais com avaliação mínima usando mock', () async {
    final service = MockProfessionalService();

    when(service.fetchProfessionals()).thenAnswer((_) async => [
      Professional(id: 1, name: 'Luis', rating: 3.4, pricePerHour: 25),
      Professional(id: 2, name: 'Ana', rating: 4.5, pricePerHour: 30),
    ]);

    final professionals = await service.fetchProfessionals();
    final filteredProfessionals = professionals.where((p) => p.rating >= 4.0).toList();

    expect(filteredProfessionals.length, 1);
    expect(filteredProfessionals[0].name, 'Ana');
  });
}