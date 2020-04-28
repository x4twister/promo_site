
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import 'model/InfoBlock.dart';
import 'model/InfoLab.dart';

class InfoBloc {

  InfoBloc() {
    _counter = 5;
    actionController.stream.listen(_increaseStream);

    _init();
  }

  int _counter;
  InfoLab infoLab;

  /// in stream
  final StreamController actionController = StreamController();
  /// out stream (rxDart)
  final counterStream = BehaviorSubject<int>.seeded(5);
  ///
  final titleStream = BehaviorSubject<String>.seeded("default");
  ///
  final blockStream = BehaviorSubject<List<InfoBlock>>.seeded([]);

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
    var json=await rootBundle.loadString('web/assets/data.json');
    infoLab=infoLabFromJson(json);
    titleStream.sink.add(infoLab.title);
    blockStream.sink.add(infoLab.blocks);
  }
}
