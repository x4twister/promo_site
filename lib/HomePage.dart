
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:promosite/InfoBloc.dart';
import 'package:promosite/model/InfoBlock.dart';

class HomePage extends StatelessWidget {

  final InfoBloc infoBloc=InfoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: infoBloc.titleStream.stream,
          builder: (context,snapshot){
            return Text("${snapshot.data.toString()}");
          },
        ),
      ),
      body: StreamBuilder<List<InfoBlock>>(
        stream: infoBloc.blockStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Scrollbar(isAlwaysShown: true,child: ListView(children:
            snapshot.data.map((block) =>
            new Container(
                //color: Colors.black12,
                //height: 100.0,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(40.0),
                decoration: BoxDecoration(borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(20.0),
                    topRight: const  Radius.circular(20.0),
                    bottomLeft: const  Radius.circular(20.0),
                    bottomRight: const  Radius.circular(20.0),
                ),
                    color: Colors.black12,
                  boxShadow: [
                    BoxShadow (
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ], ),
                child: new Column(children: [
                  new Text(block.subtitle, style: new TextStyle(fontSize: 20.0,color: Colors.green), overflow: TextOverflow.ellipsis),
                  new Text(block.text, softWrap: true, textAlign: TextAlign.justify)
                ])
              /*new Row(children: [
                  new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
                    new Text("Title", style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
                    new Expanded(child: new Text(e, softWrap: true, textAlign: TextAlign.justify))
                  ]))),
                ])*/
            )).toList()
            ));
          } else
            return Container(width: 0.0, height: 0.0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          infoBloc.actionController.sink.add(null);
          },
        tooltip: 'Increment',
        child: Icon(Icons.email),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
