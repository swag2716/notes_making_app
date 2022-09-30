
final String tableNotes = 'notes';

class NoteFields{
   static final List<String> values = [id, title, desc, time];
   static final String id = '_id';
   static final String title = 'title';
   static final String desc = 'desc';
   static final String time = 'time';
}

class Note{
   final int? id;
   final String title;
   final String desc;
   final DateTime createdTime;

  Note({this.id, this.title = "", this.desc = "", required this.createdTime});


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

Map<String, dynamic> toMap() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.desc: desc,
    NoteFields.time: createdTime.toIso8601String(),
  };

static Note fromMap(Map<String, dynamic> map) => Note(
    id: map[NoteFields.id] as int,
    title: map[NoteFields.title] as String,
    desc: map[NoteFields.desc] as String,
    createdTime: DateTime.parse(map[NoteFields.time] as String),
);
  
}

