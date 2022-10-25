import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:electricity_tariff/domain/repositories/tariff_repository.dart';
import 'package:electricity_tariff/domain/usecases/get_tariff.dart';
import 'package:mockito/mockito.dart';

var mockTariff = <Tariff>[
  Tariff(price: 10.00, validFrom: DateTime(2022), validTo: DateTime(2022)),
  Tariff(price: 12.00, validFrom: DateTime(2022), validTo: DateTime(2022)),
  Tariff(price: 22.00, validFrom: DateTime(2022), validTo: DateTime(2022))
];

class MockGetTariffPlans extends Mock implements GetTariffPlans {
  @override
  Future<List<Tariff>> execute() =>
      super.noSuchMethod(Invocation.getter(#tariff),
          returnValue: Future.delayed(
             const Duration(
                milliseconds: 500,
              ),
              () => mockTariff));
}
