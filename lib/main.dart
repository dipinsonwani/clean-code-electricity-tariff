import 'package:electricity_tariff/data/datasources/remote_data_source.dart';
import 'package:electricity_tariff/data/repositories/tariff_repo_impl.dart';
import 'package:electricity_tariff/domain/usecases/get_tariff.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_bloc.dart';
import 'package:electricity_tariff/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TariffBloc(
          GetTariffPlans(TariffRepositoryImpl(RemoteDataSourceImpl()))),
      child: MaterialApp(
        title: 'Electricity Tariff',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
