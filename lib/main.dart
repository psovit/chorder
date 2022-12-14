import 'package:chorder/screens.dart/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chorder App',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _tec = TextEditingController();
//   final PitchHandler _pitchHandler = PitchHandler(InstrumentType.guitar);
//   String _note = '';

//   Future<void> checkNote(double pitch) async {
//     //Uses the pitchUp library to check if a a given pitch consists of a guitar note and if it's tuned
//     final PitchResult handledPitchResult = _pitchHandler.handlePitch(pitch);

//     setState(() {
//       _note = handledPitchResult.note;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         padding: const EdgeInsets.all(50),
//         child: Column(
//           children: [
//             TextField(
//               controller: _tec,
//               keyboardType: TextInputType.number,
//               onChanged: (String? val) {},
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 checkNote(double.parse(_tec.text));
//               },
//               child: const Text('Show Note'),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               'Note: $_note',
//               style: const TextStyle(fontSize: 18),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tec.dispose();
//     super.dispose();
//   }
// }
