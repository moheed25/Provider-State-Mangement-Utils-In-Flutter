import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proviutils/Provider/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (context) => HomePageProvider(),
          child:
              Consumer<HomePageProvider>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.eligibilityMessage.toString(),
                  style: TextStyle(
                    color: (provider.isEligible == true)
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Your Age"),
                  onChanged: (val) {
                    provider.checkEligibility(int.parse(val));
                  },
                )
              ],
            );
          }),
        ),
      )),
    );
  }
}
