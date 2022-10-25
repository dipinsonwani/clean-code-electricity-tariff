import 'dart:math';

import 'package:flutter/material.dart';

import '../entities/tariff.dart';

class GetBestTariff {
  static Tariff getBestTariff(List<Tariff> tariffList) {
    List<Tariff> list = [];
    list.addAll(tariffList);
    list.sort(((a, b) => a.price!.compareTo(b.price!)));
    return list[0];
  }

  static DateTimeRange getBest4hourBlock(List<Tariff> tariffList) {
    List<Tariff> list = [];
    list.addAll(tariffList);
    List<int> avgList = [0, 8];
    double minSum = 0;
    for (int i = 0; i < 8; i++) {
      minSum += list[i].price!;
    }
    double sum = minSum;
    for (int j = 8; j < list.length - 8; j++) {
      sum = minSum + list[j].price! - list[j - 8].price!;
      minSum = min(sum, minSum);
    }
    double minAvg = minSum / 8;
    var daterange = DateTimeRange(
        start: list[avgList[0]].validFrom!, end: list[avgList[1]].validFrom!);
    return daterange;
  }
}
