import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {
  int initialCountOne = 0;
  int initialCountTwo = 0;

  BehaviorSubject<int> _teamOneCounter, _teamTwoCounter;

  CounterBloc({this.initialCountOne, this.initialCountTwo}) {
    _teamOneCounter = BehaviorSubject<int>.seeded(this.initialCountOne);
    _teamTwoCounter = BehaviorSubject<int>.seeded(this.initialCountTwo);
  }

  Observable<int> get teamOneObs => _teamOneCounter.stream;
  Observable<int> get teamTwoObs => _teamTwoCounter.stream;

  incrementTeamOne() {
    initialCountOne++;
    _teamOneCounter.sink.add(initialCountOne);
  }

  incrementTeamTwo() {
    initialCountTwo++;
    _teamTwoCounter.sink.add(initialCountTwo);
  }

  @override
  void dispose() {
    _teamOneCounter.close();
    _teamTwoCounter.close();
    super.dispose();
  }
}
