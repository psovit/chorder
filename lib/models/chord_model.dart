import 'package:chorder/extensions/exports.dart';
import 'package:chorder/models/enums.dart';

class Chord {
  final Note rootNote;
  final List<Note> allNotes;
  final ChordDescriptor descriptor;

  String get notation => descriptor.placeholderNotation.replaceAll(
        'X',
        rootNote.displayTitle,
      );

  String get fullDisplayName =>
      '${rootNote.displayTitle} ${descriptor.chordTypeName}';

  Chord({
    required this.rootNote,
    required this.allNotes,
    required this.descriptor,
  });

  static List<Chord> generateAllPossibleChords() {
    final List<Chord> chords = <Chord>[];
    for (var note in Note.values) {
      chords.addAll(Chord.chordsFromRootNote(note));
    }
    return chords;
  }

  static List<Chord> chordsFromRootNote(Note note) {
    final List<Chord> chords = <Chord>[];
    final List<ChordDescriptor> descriptions = ChordDescriptor.getAll();

    final Map<String, Note> csNotePositionMap = note.csNotePositionMap();
    for (var chordType in ChordType.values) {
      final ChordDescriptor descriptor = descriptions.firstWhere(
        (_) => _.chordType == chordType,
      );

      final List<String> noteIntervals =
          descriptor.noteIntervalsText.split(',');

      final List<Note> chordNotes = noteIntervals
          .map((String noteInterval) => csNotePositionMap[noteInterval]!)
          .toList();

      final Chord chord = Chord(
        allNotes: chordNotes,
        descriptor: descriptor,
        rootNote: note,
      );
      chords.add(chord);
    }
    return chords;
  }
}

class ChordDescriptor {
  final ChordType chordType;
  final String chordTypeName;
  final String noteIntervalsText;
  final String placeholderNotation;

  ChordDescriptor(
    this.chordType,
    this.chordTypeName,
    this.noteIntervalsText,
    this.placeholderNotation,
  );

  // Descriptions for all possible chords for X note
  static List<ChordDescriptor> getAll() {
    return <ChordDescriptor>[
      ChordDescriptor(
        ChordType.major,
        'Major',
        '1,3,5',
        'X',
      ),
      ChordDescriptor(
        ChordType.minor,
        'Minor',
        '1,3b,5',
        'Xm',
      ),
      ChordDescriptor(
        ChordType.augmented,
        'Augmented',
        '1,3,5+',
        'X+',
      ),
      ChordDescriptor(
        ChordType.diminished,
        'Diminished',
        '1,3b,5b',
        'Xo',
      ),
      ChordDescriptor(
        ChordType.suspended,
        'Suspended',
        '1,3+,5',
        'Xsus,Xsus4',
      ),
      ChordDescriptor(
        ChordType.seventh,
        'Seventh',
        '1,3,5,7b',
        'X7',
      ),
      ChordDescriptor(
        ChordType.ninthSecond,
        'Ninth, Second',
        '1,3,5,7b,9',
        'X9, X2',
      ),
      ChordDescriptor(
        ChordType.eleventh,
        'Eleventh',
        '1,3,5,7b,11',
        'X11',
      ),
      ChordDescriptor(
        ChordType.thirteenth,
        'Thirteenth',
        '1,3,5,7b,13',
        'X13',
      ),
      ChordDescriptor(
        ChordType.majorSeventh,
        'Major Seventh',
        '1,3,5,7',
        'Xmaj7',
      ),
      ChordDescriptor(
        ChordType.majorNinth,
        'Major Ninth',
        '1,3,5,7,9',
        'Xmaj9',
      ),
      ChordDescriptor(
        ChordType.minorSixth,
        'Minor Sixth',
        '1,3b,5,6',
        'Xm6',
      ),
      ChordDescriptor(
        ChordType.minorSeventh,
        'Minor Seventh',
        '1,3b,5,7b',
        'Xm7',
      ),
      ChordDescriptor(
        ChordType.minorNinth,
        'Minor Ninth',
        '1,3b,5,7b,9',
        'Xm9',
      ),
      ChordDescriptor(
        ChordType.minorMajor7,
        'Minor Major 7',
        '1,3b,5,7',
        'Xm#7, Xm(+7)',
      ),
      ChordDescriptor(
        ChordType.minorSeventh5b,
        'Minor Seventh,5b',
        '1,3b,5b,7b',
        'Xm7(5b)',
      ),
      ChordDescriptor(
        ChordType.sixth,
        'Sixth',
        '1,3,5,6',
        'X6',
      ),
      ChordDescriptor(
        ChordType.sixthWtNinth,
        'Sixth w/Ninth',
        '1,3,5,6,9',
        'X6/9',
      ),
      ChordDescriptor(
        ChordType.seventh5b,
        'Seventh/5b',
        '1,3,5b,7b',
        'X7(5b)',
      ),
      ChordDescriptor(
        ChordType.seventh9b,
        'Seventh/9b',
        '1,3,5,7b,9b',
        'X7(9b)',
      ),
      ChordDescriptor(
        ChordType.diminished7th,
        'Diminished 7th',
        '1,3b,5b,7bb',
        'Xo7',
      ),
    ];
  }
}
