import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40.0), // Empty space at the top

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the text horizontally
                children: [
                  Text("EcoSaver ",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  Text("Rewards",
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 24)),
                ],
              ),
            ),

            Center(
              child: Container(
                  margin: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "49",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: const Text(
                            "Coins",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: const Text(
                            "1 Coin = Rs. 1",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the value for slight roundness
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.amber),
                            ),
                            child: Text(
                              'Redeem __ coins now',
                              style: TextStyle(
                                color:
                                    Colors.black, // Set the text color to black
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 8),
                          child: const Text(
                            "You need __ more coins to redeem all.",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),

            SizedBox(height: 20.0), // Empty space between the card and list

            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: 20, // Replace with your desired item count
            //   itemBuilder: (context, index) {
            //     return Center(
            //       child: Container(
            //         margin: EdgeInsets.all(20.0),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(20.0),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               spreadRadius: 3,
            //               blurRadius: 5,
            //             ),
            //           ],
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.all(20.0),
            //           child: Text(
            //             "List Item $index",
            //             style: TextStyle(fontSize: 20.0),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
