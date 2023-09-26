import 'package:e_waste_app/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoSaver"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/HomeImg1.jpg'),
            const Text(
              "JUNK SE JUNG",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Empowering a Greener Tomorrow",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Transforming discarded gadgets into a sustainable future. Our mission is to responsibly recycle and repurpose electronic waste, reducing its environmental impact while safeguarding valuable resources. Join us in the journey towards a cleaner, greener planet powered by eco-friendly tech solutions.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ));
              },
              child: const Text("Start Recycling"),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Your Electronics, Our Commitment",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Evaluate Your Results By Browsing our E-waste Locator",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Evaluate your results by browsing our E-waste Locator and discover convenient drop-off points near you. Take the next step towards responsible e-waste disposal and recycling. Find the closest collection centers and make an impact today.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
