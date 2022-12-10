enum Note { c, cSharp, d, dSharp, e, f, fSharp, g, gSharp, a, aSharp, b }

//ref: https://www.michael-thomas.com/music/class/chord_construction.htm
enum ChordType {
  // 5 Basic Chords
  major, //Major chord - made up of the 1,3, and 5 note in that keys scale.
  minor, //Minor chord - flat the 3rd note of the scale.
  diminished, //Augmented chord - sharp the 5th note of the scale.
  augmented, //Augmented chord - sharp the 5th note of the scale.
  suspended, //eg: csus4/csus
  // 4 Dominant Chords
  seventh,
  ninthSecond,
  eleventh,
  thirteenth,
  // 2 Other Major Chords
  majorSeventh,
  majorNinth,
  // 5 Other Minor Chords
  minorSixth,
  minorSeventh,
  minorNinth,
  minorMajor7, // wtf?
  minorSeventh5b, // wtf?!
  // 5 Other Chords
  sixth,
  sixthWtNinth,
  seventh5b,
  seventh9b,
  diminished7th,
}
