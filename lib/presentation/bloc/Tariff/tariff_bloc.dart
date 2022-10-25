import 'package:electricity_tariff/domain/usecases/get_tariff.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_event.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TariffBloc extends Bloc<TariffEvent, TariffState> {
  final GetTariffPlans getTariffPlans;
  TariffBloc(this.getTariffPlans) : super(TariffInitialState()) {
    on<TariffInitialEvent>((event, emit) async {
      emit(TariffLoadingState());
      var result;
      try {
        result = await getTariffPlans.execute();
      } catch (e) {
        emit(TariffErrorState(e.toString()));
      }

      emit(TariffFetchedState(result));
    });
  }
}
