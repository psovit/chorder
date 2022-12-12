import 'package:chorder/extensions/exports.dart';
import 'package:chorder/models/exports.dart';
import 'package:chorder/widgets/chord_card.dart';
import 'package:flutter/material.dart';

class ChordFinder extends StatefulWidget {
  const ChordFinder({Key? key}) : super(key: key);

  @override
  State<ChordFinder> createState() => _ChordFinderState();
}

class _ChordFinderState extends State<ChordFinder> {
  final List<Note> _selectedNotes = <Note>[];
  final List<Chord> _allPossibleChords = Chord.generateAllPossibleChords();

  final ValueNotifier<List<Chord>> _chordsForNotesNotifier =
      ValueNotifier(<Chord>[]);

  @override
  void initState() {
    super.initState();
    _chordsForNotesNotifier.value = _allPossibleChords;
  }

  List<Chord> _calculateChords() {
    List<Chord> chordsForNotes = <Chord>[];

    for (var chord in _allPossibleChords) {
      if (_selectedNotes.every((item) => chord.allNotes.contains(item))) {
        chordsForNotes.add(chord);
      }
    }
    return chordsForNotes;
  }

  Widget _noteSelector() {
    final List<Widget> actionChips = <Widget>[];
    for (var value in Note.values) {
      final bool selected = _selectedNotes.contains(value);
      final ActionChip ac = ActionChip(
        backgroundColor: selected ? Colors.green : Colors.white,
        label: Text(
          value.displayTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            if (selected) {
              _selectedNotes.remove(value);
            } else {
              _selectedNotes.add(value);
            }

            _chordsForNotesNotifier.value = _calculateChords();
          });
        },
      );
      actionChips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ac,
        ),
      );
    }
    final Row row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actionChips,
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: row,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pick notes to filter chords',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 100,
            child: _noteSelector(),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _possibleChords(),
          )
        ],
      ),
    );
  }

  Widget _possibleChords() {
    return ValueListenableBuilder(
      valueListenable: _chordsForNotesNotifier,
      builder: (
        BuildContext ctxt,
        List<Chord> chordsForNotes,
        Widget? child,
      ) {
        if (chordsForNotes.isEmpty) {
          return const SizedBox();
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: chordsForNotes.length,
          itemBuilder: (BuildContext context, int index) {
            final Chord chord = chordsForNotes[index];
            return ChordCard(
              chord: chord,
              selectedNotes: _selectedNotes,
            );
          },
        );
      },
    );
  }
}
