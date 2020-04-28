
import 'dart:convert';

import 'InfoBlock.dart';

InfoLab infoLabFromJson(String str) => InfoLab.fromJson(json.decode(str));

String infoLabToJson(InfoLab data) => json.encode(data.toJson());

class InfoLab {
  String title;
  List<InfoBlock> blocks;

  InfoLab({
    this.title,
    this.blocks,
  });

  factory InfoLab.fromJson(Map<String, dynamic> json) => InfoLab(
    title: json["title"],
    blocks: List<InfoBlock>.from(json["blocks"].map((x) => InfoBlock.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
  };
}
