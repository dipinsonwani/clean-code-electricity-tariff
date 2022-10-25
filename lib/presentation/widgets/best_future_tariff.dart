import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:electricity_tariff/domain/usecases/get_best_tariff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class BestFutureTariff extends StatefulWidget {
  final List<Tariff> tariffList;
  const BestFutureTariff({super.key, required this.tariffList});

  @override
  State<BestFutureTariff> createState() => _BestFutureTariffState();
}

class _BestFutureTariffState extends State<BestFutureTariff> {
  Tariff? bestTariff;
  List<Tariff> list = [];
  @override
  void initState() {
    list = widget.tariffList;
    print(GetBestTariff.getBest4hourBlock(list));

    bestTariff = GetBestTariff.getBestTariff(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Text(
            DateFormat('dd MMM HH:mm').format(bestTariff!.validFrom!),
          ),
          Text(
            bestTariff!.price.toString(),
          )
        ],
      ),
    );
  }
}
