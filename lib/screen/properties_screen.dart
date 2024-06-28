// import 'package:flutter/material.dart';

// class PropertiesScreen extends StatefulWidget {
//   const PropertiesScreen({super.key});

//   @override
//   State<PropertiesScreen> createState() => _PropertiesScreenState();
// }

// class _PropertiesScreenState extends State<PropertiesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // final Map<String, dynamic> property =
//     //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(property['title']),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(property['image']),
//             SizedBox(height: 10),
//             Text(property['title'], style: TextStyle(fontSize: 28)),
//             SizedBox(height: 10),
//             Text(property['price'], style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             Text('Property Details:', style: TextStyle(fontSize: 20)),
//             // Add more property details here
//           ],
//         ),s
//       ),
//     );
//   }
// }
