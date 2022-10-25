import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:equatable/equatable.dart';

class TariffModel extends Equatable {
  final double? price;
  final DateTime? validFrom;
  final DateTime? validTo;
  const TariffModel({this.price, this.validFrom, this.validTo});

  factory TariffModel.fromJson(Map<String, dynamic> json) => TariffModel(
      price: json['value_inc_vat'],
      validFrom: DateTime.parse(json['valid_from']!),
      validTo: DateTime.parse(json['valid_to']!));

  Tariff toEntity() =>
      Tariff(price: price, validFrom: validFrom, validTo: validTo);

  @override
  List<Object?> get props => [price, validFrom, validTo];
}
