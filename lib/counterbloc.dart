import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {
  int initialCount = 0;

  BehaviorSubject<int> _counter;

  CounterBloc({this.initialCount}) {
    _counter = BehaviorSubject<int>.seeded(this.initialCount);
  }

  Observable<int> get counterObservable => _counter.stream;

  increment() {
    initialCount++;
    _counter.sink.add(initialCount);
  }

  decrement() {
    initialCount--;
    _counter.sink.add(initialCount);
  }

  @override
  void dispose() {
    _counter.close();
    super.dispose();
  }
}
