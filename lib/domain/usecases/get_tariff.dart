import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:electricity_tariff/domain/repositories/tariff_repository.dart';

class GetTariffPlans {
  final TariffRepository tariffRepository;

  GetTariffPlans(this.tariffRepository);

  Future<List<Tariff>> execute() async {
    var list = await tariffRepository.getTariffPlans();
    return list.reversed.toList();
  }
}
