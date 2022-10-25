import 'package:equatable/equatable.dart';

import '../../../domain/entities/tariff.dart';


abstract class TariffState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TariffInitialState extends TariffState {}

class TariffLoadingState extends TariffState {}

class TariffErrorState extends TariffState {
  final String message;

  TariffErrorState(this.message);
  @override
  List<Object?> get props => [];
}

class TariffFetchedState extends TariffState {
  final List<Tariff> tariffList;

  TariffFetchedState(this.tariffList);
  @override
  List<Object?> get props => [];
}
