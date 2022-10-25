import 'package:electricity_tariff/data/datasources/remote_data_source.dart';
import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:electricity_tariff/domain/repositories/tariff_repository.dart';

class TariffRepositoryImpl implements TariffRepository {
  final RemoteDataSource remoteDataSource;

  TariffRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<Tariff>> getTariffPlans() async {
    var tariffList = await remoteDataSource.getTariffPlans();
    return tariffList.map((e) => e.toEntity()).toList();
  }
}
