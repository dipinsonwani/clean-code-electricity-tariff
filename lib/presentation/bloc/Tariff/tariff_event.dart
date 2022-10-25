import 'package:equatable/equatable.dart';

abstract class TariffEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TariffInitialEvent extends TariffEvent {}
