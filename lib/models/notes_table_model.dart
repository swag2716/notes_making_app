
const String tableNotes = 'notes';

class NoteFields{
  static final List<String> values = [id, title, desc, createdTime];
  static const String id = '_id';
  static const String title = 'title';
  static const String desc = 'desc';
  static const String createdTime = 'createdTime';
}

class Note{
  final int? id;
  final String title;
  final String desc;
  final DateTime createdTime;

  Note({this.id, required this.title, required this.desc, required this.createdTime});


  Note copy({
    int? id,
    String? title,
    String? desc,
    DateTime? createdTime,
  })=> 
  Note(
      id: id ?? this.id,
     title: title ?? this.title, 
     desc: desc ?? this.desc, 
     createdTime: createdTime ?? this.createdTime
     );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    title: json[NoteFields.title] as String,
    desc: json[NoteFields.desc] as String,
    createdTime: json[NoteFields.createdTime] as DateTime,
  );



  Map<String, Object?> toJson() => {
    NoteFields.id: id!,
    NoteFields.title: title,
    NoteFields.desc: desc,
    NoteFields.createdTime: createdTime.toIso8601String(),
  };
}

