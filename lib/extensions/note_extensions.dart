import 'package:chorder/models/exports.dart';

extension SelectedColorExtension on Note {
  Note noteAbove(int interval) {
    int nextIndex = index + interval;
    if (nextIndex > 11) {
      nextIndex = nextIndex % 12;
    }
    return Note.values[nextIndex];
  }

  Note noteBelow(int interval) {
    int nextIndex = index - interval;
    if (nextIndex < 0) {
      nextIndex = nextIndex + 12;
    }
    return Note.values[nextIndex];
  }

  String get displayTitle {
    switch (this) {
      case Note.c:
        return 'C';
      case Note.cSharp:
        return 'C#';
      case Note.d:
        return 'D';
      case Note.dSharp:
        return 'D#';
      case Note.e:
        return 'E';
      case Note.f:
        return 'F';
      case Note.fSharp:
        return 'F#';
      case Note.g:
        return 'G';
      case Note.gSharp:
        return 'G#';
      case Note.a:
        return 'A';
      case Note.aSharp:
        return 'A#';
      case Note.b:
        return 'B';
      default:
        return 'C';
    }
  }

  /// Using Chromatic Scale i.e. W-W-H-W-W-W-H
  /// Example: C
  /// C major: C,D,E,F,G,A,B,C,D,E,F,G,A
  /// C major: 1,2,3,4,5,6,7,8,9,10,11,12,13
  Map<String, Note> csNotePositionMap() {
    return <String, Note>{
      '1': this,
      '2': noteAbove(2),
      '3b': noteAbove(3),
      '3': noteAbove(4),
      '3+': noteAbove(5),
      '4': noteAbove(5),
      '5b': noteAbove(6),
      '5': noteAbove(7),
      '5+': noteAbove(8),
      '6': noteAbove(9),
      '7b': noteAbove(10),
      '7bb': noteAbove(9),
      '7': noteAbove(11),
      '8': this,
      '9b': noteAbove(1),
      '9': noteAbove(2),
      '11': noteAbove(5),
      '13': noteAbove(9),
    };
  }
}
