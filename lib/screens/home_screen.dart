import 'package:e_waste_app/screens/mapScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});
  final String userId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          InkWell(
            onTap: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('userId');
              if (context.mounted) {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) => const Base(),
                //   ),
                // );

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/base', // Replace with the route name for your login screen
                  (route) => false, // Remove all previous routes from the stack
                );
              }
            },
            child: const Row(
              children: [
                Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.logout),
                SizedBox(
                  width: 12,
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User id: ${widget.userId}"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
              child: const Text("Show map"),
            ),
          ],
        ),
      ),
    );
  }
}
