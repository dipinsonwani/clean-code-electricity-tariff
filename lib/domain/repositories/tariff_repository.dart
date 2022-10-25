import 'package:electricity_tariff/domain/entities/tariff.dart';

abstract class TariffRepository {
  Future<List<Tariff>> getTariffPlans();
}