
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'InfoLab.dart';

class InfoBloc {

  InfoBloc() {
    _counter = 5;
    actionController.stream.listen(_increaseStream);

    _init();
  }

  int _counter;
  InfoLab infoLab;

  /// Поток для ввода
  final StreamController actionController = StreamController();
  /// Поток для вывода (rxDart)
  final counterStream = BehaviorSubject<int>.seeded(5);
  ///
  final titleStream = BehaviorSubject<String>.seeded("default");
  ///
  final blockStream = BehaviorSubject<List<Block>>.seeded([]);

  void _increaseStream(data) {
    _counter += 1;
    counterStream.sink.add(_counter);
  }

  void dispose() {
    actionController.close();
    counterStream.close();
    titleStream.close();
    blockStream.close();
  }

  _init() async {
    var json=await _getJSON();
    infoLab=infoLabFromJson(json);
    titleStream.sink.add(infoLab.title);
    blockStream.sink.add(infoLab.blocks);
  }

  _getJSON() {
    return "{\"title\":\"TITLE\",\"blocks\":[{\"subtitle\":\"SUBTITLE\",\"text\":\"TEXT\"}]}";
  }
}
