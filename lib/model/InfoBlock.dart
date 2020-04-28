

class InfoBlock {
  String subtitle;
  String text;

  InfoBlock({
    this.subtitle,
    this.text,
  });

  factory InfoBlock.fromJson(Map<String, dynamic> json) => InfoBlock(
    subtitle: json["subtitle"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "subtitle": subtitle,
    "text": text,
  };
}
