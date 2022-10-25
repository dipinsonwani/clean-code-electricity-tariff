import 'package:electricity_tariff/domain/usecases/get_best_tariff.dart';
import 'package:electricity_tariff/presentation/widgets/best_future_tariff.dart';
import 'package:intl/intl.dart';
import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../bloc/Tariff/tariff_bloc.dart';
import '../bloc/Tariff/tariff_event.dart';
import '../bloc/Tariff/tariff_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tariff> _tariffList = [];
  @override
  void initState() {
    context.read<TariffBloc>().add(TariffInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TariffBloc, TariffState>(
      builder: (context, state) {
        if (state is TariffLoadingState) {
          return Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()));
        } else if (state is TariffFetchedState) {
          _tariffList = state.tariffList;
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Electricity Tariff Plans'),
                bottom: const TabBar(tabs: [
                  Tab(
                    child: Text('Show Graph', textAlign: TextAlign.center),
                  ),
                  Tab(
                    child: Text(
                      'Best Future Tariff',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    child:
                        Text('Best 4-hour block', textAlign: TextAlign.center),
                  ),
                ]),
              ),
              body: Center(
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: TabBarView(
                    children: [
                      SfCartesianChart(
                        primaryXAxis: CategoryAxis(arrangeByIndex: true),
                        series: <ChartSeries<Tariff, String>>[
                          LineSeries<Tariff, String>(
                            dataSource: state.tariffList,
                            xValueMapper: (Tariff data, _) =>
                                DateFormat('dd MMM HH:mm')
                                    .format(data.validFrom!),
                            yValueMapper: (Tariff data, _) => data.price,
                            // dataLabelSettings:
                            //     const DataLabelSettings(isVisible: true),
                          )
                        ],
                      ),
                      // BlocBuilder<TariffBloc, TariffState>(
                      //   builder: (context, state) {
                      //     if (state is TariffLoadingState) {
                      //       return const Center(child: CircularProgressIndicator());
                      //     } else if (state is TariffFetchedState) {
                      //       _tariffList = state.tariffList;
                      //       return ;
                      //     }
                      //     return Container();
                      //   },
                      // ),
                      BestFutureTariff(tariffList: _tariffList),
                      Column(
                        children: [
                          const Text('Best 4 hour block is'),
                          Text(
                              '${DateFormat('dd MMM HH:mm').format(GetBestTariff.getBest4hourBlock(_tariffList).start)} - ${DateFormat('dd MMM HH:mm').format(GetBestTariff.getBest4hourBlock(_tariffList).end)}'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is TariffErrorState) {
          return Material(
            child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Error Fetching data',style: TextStyle(color: Colors.black),),
                )),
          );
        }
        return Container();
      },
    );
  }
}
