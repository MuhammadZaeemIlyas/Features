// // import 'dart:io';

// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:record/record.dart';

// // class Voicerecording extends StatefulWidget {
// //   const Voicerecording({super.key});

// //   @override
// //   State<Voicerecording> createState() => _VoicerecordingState();
// // }

// // class _VoicerecordingState extends State<Voicerecording> {
// //   final Record = AudioRecorder();
// //   late AudioPlayer audioPlayer;

// //   Future<String> generateValidPath() async {
// //     Directory? directory = await getExternalStorageDirectory();
// //     String path = directory!.path + '/myFile.m4a';
// //     return path;
// //   }

// //   Future<void> startrecording() async {
// //     try {
// //       if (await Record.hasPermission()) {
// //         String filePath = await generateValidPath();

// //         await Record.start(RecordConfig(), path: filePath);

// //         final steam = await Record.startStream(
// //             RecordConfig(encoder: AudioEncoder.pcm16bits));
// //       }
// //       final path = await Record.stop();
// // // ... or cancel it (and implicitly remove file/blob).
// //       await Record.stop();

// //       Record.dispose();
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<void> playrecording() async {
// //     try {
// //       String filePath = await generateValidPath();
// //       Source urlsource = UrlSource(filePath);
// //       await audioPlayer.play(urlsource);
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   @override
// //   void initState() {
// //     audioPlayer = AudioPlayer();
// //     // TODO: implement initState
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Center(
// //           child: Column(
// //             children: [
// //               ElevatedButton(
// //                   onPressed: () {
// //                     startrecording();
// //                   },
// //                   child: Text('start')),
// //               ElevatedButton(
// //                   onPressed: () {
// //                     playrecording();
// //                   },
// //                   child: Text('play')),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RecorderApp(),
//     );
//   }
// }

// class RecorderApp extends StatefulWidget {
//   @override
//   _RecorderAppState createState() => _RecorderAppState();
// }

// class _RecorderAppState extends State<RecorderApp> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   String recordingPath;

//   Future<void> startRecording() async {
//     var status = await Permission.microphone.request();
//     if (status.isGranted) {
//       Directory appDocDir = await getApplicationDocumentsDirectory();
//       recordingPath = appDocDir.path + '/myRecording.m4a';
//       await audioPlayer.startRecorder(toFile: recordingPath, codec: Codec.aacADTS);
//     } else {
//       print('Microphone permission denied');
//     }
//   }

//   Future<void> stopRecording() async {
//     await audioPlayer.stopReco  textDirectionToAxisDirection();
//   }

//   Future<void> playRecording() async {
//     if (recordingPath != null) {
//       await audioPlayer.play(recordingPath, isLocal: true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sound Recorder'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: startRecording,
//               child: Text('Start Recording'),
//             ),
//             ElevatedButton(
//               onPressed: stopRecording,
//               child: Text('Stop Recording'),
//             ),
//             ElevatedButton(
//               onPressed: playRecording,
//               child: Text('Play Recording'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
// }
