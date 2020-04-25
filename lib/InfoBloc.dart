
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'InfoLab.dart';

class InfoBloc {

  InfoBloc() {
    _counter = 5;
    infoLab=new InfoLab();
    titleStream.sink.add(infoLab.title);
    actionController.stream.listen(_increaseStream);
  }

  int _counter;
  InfoLab infoLab;

  /// Поток для ввода
  final StreamController actionController = StreamController();
  /// Поток для вывода (rxDart)
  final counterStream = BehaviorSubject<int>.seeded(5);
  ///
  final titleStream = BehaviorSubject<String>.seeded("default");

  void _increaseStream(data) {
    _counter += 1;
    counterStream.sink.add(_counter);
  }

  void dispose() {
    actionController.close();
    counterStream.close();
    titleStream.close();
  }
}
