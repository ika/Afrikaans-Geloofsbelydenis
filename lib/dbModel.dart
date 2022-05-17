class Chapter {
  int id;
  String chap;
  String title;
  String text;

  Chapter({required this.id, required this.chap, required this.title, required this.text});

  // used when inserting data to the database
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "chap": chap,
      "title": title,
      "text": text,
    };
  }
}
