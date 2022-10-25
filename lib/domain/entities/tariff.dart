import 'package:equatable/equatable.dart';

class Tariff extends Equatable {
  final double? price;
  final DateTime? validFrom;
  final DateTime? validTo;
  const Tariff({this.price, this.validFrom, this.validTo});

  @override
  List<Object?> get props => [price, validFrom, validTo];
}
