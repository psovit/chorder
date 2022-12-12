import 'package:chorder/models/exports.dart';
import 'package:flutter/material.dart';
import 'package:chorder/extensions/note_extensions.dart';

class ChordCard extends StatelessWidget {
  final Chord chord;
  final List<Note> selectedNotes;

  const ChordCard({
    Key? key,
    required this.chord,
    required this.selectedNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            chord.fullDisplayName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: _notesDisplay(chord.allNotes),
          ),
          Text(
            'Root: ${chord.rootNote.displayTitle}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _notesDisplay(List<Note> notes) {
    return notes
        .map(
          (e) => CircleAvatar(
            radius: 12,
            backgroundColor: selectedNotes.contains(e) ? Colors.yellow : null,
            child: Text(
              e.displayTitle,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
        .toList();
  }
}
