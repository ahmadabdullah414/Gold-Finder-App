import 'package:flutter/material.dart';

class GoldApp extends StatefulWidget {
  const GoldApp({super.key});

  @override
  State<GoldApp> createState() => _GoldAppState();
}

class _GoldAppState extends State<GoldApp> {
  TextEditingController tolaPrice = TextEditingController();
  TextEditingController TolaQuantityController = TextEditingController();
  TextEditingController MashaQuantityController = TextEditingController();
  TextEditingController RattiQuantityController = TextEditingController();
  double totalPrie = 0;
  double Price1 = 0;
  double Price2 = 0;
  double Price3 = 0;
  double tola = 0;
  double masha = 0;
  double ratti = 0;

  bool showTolaPrice = false;
  bool showMashaPrice = false;
  bool showRattiPrice = false;

  // Helper function to handle empty fields
  double parseInput(String input) {
    return input.isEmpty ? 0 : double.parse(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Gold App',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "1 Tola = 12 Masha = 96 Ratti = 11.664 grams",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.yellow)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Tola Price',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.yellow,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: tolaPrice,
                    textAlign:
                        TextAlign.center, // Center hint text and input text
                  ),
                ),
              ),
            ),
            Text(
              'Price List',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            ),
            Divider(
              thickness: 2,
              color: Colors.yellow,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tola Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (showTolaPrice) {
                          showTolaPrice = false;
                        } else {
                          tola = double.parse(tolaPrice.text) / 1;
                          showTolaPrice = true;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text(
                          showTolaPrice
                              ? '${tola.toStringAsFixed(2)} Rs'
                              : 'Tola',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  // Masha Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (showMashaPrice) {
                          showMashaPrice = false;
                        } else {
                          masha = double.parse(tolaPrice.text) / 12;
                          showMashaPrice = true;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text(
                          showMashaPrice
                              ? '${masha.toStringAsFixed(2)} Rs'
                              : 'Masha',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  // Ratti Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (showRattiPrice) {
                          showRattiPrice = false;
                        } else {
                          ratti = double.parse(tolaPrice.text) / 96;
                          showRattiPrice = true;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text(
                          showRattiPrice
                              ? ' ${ratti.toStringAsFixed(2)} Rs'
                              : 'Ratti',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.yellow,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.yellow)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Tola Quantity',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.yellow,
                      ),
                      border: InputBorder.none,
                    ),
                    controller: TolaQuantityController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center, // Center hint and input text
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.yellow)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Masha Quantity',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.yellow,
                      ),
                      border: InputBorder.none,
                    ),
                    controller: MashaQuantityController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center, // Center hint and input text
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.yellow)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Ratti Quantity',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.yellow,
                      ),
                      border: InputBorder.none,
                    ),
                    controller: RattiQuantityController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center, // Center hint and input text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Calculate',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double tolaQuantity = parseInput(TolaQuantityController.text);
                  double mashaQuantity =
                      parseInput(MashaQuantityController.text);
                  double rattiQuantity =
                      parseInput(RattiQuantityController.text);

                  totalPrie = tola * tolaQuantity +
                      masha * mashaQuantity +
                      ratti * rattiQuantity;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Calculate',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total Price: ${totalPrie.toStringAsFixed(2)} Rs',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
