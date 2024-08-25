import 'package:app_test/src/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                Provider.of<GlobalProvider>(context, listen: false).mToken,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                "Details Page",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          )),
    );
  }
}
