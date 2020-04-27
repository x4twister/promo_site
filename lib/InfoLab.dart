
import 'dart:convert';

InfoLab infoLabFromJson(String str) => InfoLab.fromJson(json.decode(str));

String infoLabToJson(InfoLab data) => json.encode(data.toJson());

class InfoLab {
  String title;
  List<Block> blocks;

  InfoLab({
    this.title,
    this.blocks,
  });

  factory InfoLab.fromJson(Map<String, dynamic> json) => InfoLab(
    title: json["title"],
    blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
  };
}

class Block {
  String subtitle;
  String text;

  Block({
    this.subtitle,
    this.text,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    subtitle: json["subtitle"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "subtitle": subtitle,
    "text": text,
  };
}