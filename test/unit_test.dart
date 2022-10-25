
import 'package:bloc_test/bloc_test.dart';
import 'package:electricity_tariff/domain/entities/tariff.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_bloc.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_event.dart';
import 'package:electricity_tariff/presentation/bloc/Tariff/tariff_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'tariff_bloc_mocks.dart';


void main() {
  late MockGetTariffPlans mockGetTariffPlans;
  late TariffBloc tariffBloc;

  setUp(() {
    mockGetTariffPlans = MockGetTariffPlans();
    tariffBloc = TariffBloc(mockGetTariffPlans);
  });

  var mockTariff = <Tariff>[
    Tariff(price: 10.00, validFrom: DateTime(2022), validTo: DateTime(2022)),
    Tariff(price: 12.00, validFrom: DateTime(2022), validTo: DateTime(2022)),
    Tariff(price: 22.00, validFrom: DateTime(2022), validTo: DateTime(2022))
  ];

  test(
    'should start with initial state',
    () {
      expect(tariffBloc.state, TariffInitialState());
    },
  );
  blocTest<TariffBloc, TariffState>(
    'should emit loading/fetched when data is fetched successfully',
    act: ((bloc) => bloc.add(TariffInitialEvent())),
    wait: const Duration(seconds: 3),
    build: () {
      when(mockGetTariffPlans.execute())
          .thenAnswer((_) async => [...mockTariff]);
      return tariffBloc;
    },
    expect: () => [TariffLoadingState(), TariffFetchedState(mockTariff)],
    verify: ((bloc) {
      verify(mockGetTariffPlans.execute());
    }),
  );
}
