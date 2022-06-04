import 'package:flutter/material.dart';
import 'package:get_data/app/service/domain/service_response.dart';

import '../service/api/api_call.dart';
import '../service/domain/info.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  Auth auth = Auth();

  late Future<ServiceResponse> data;

  void getData() {
    data = auth.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: FutureBuilder<ServiceResponse?>(
              future: data,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  ServiceResponse? intel = snapshot.data;
                  Info? data = intel!.data;
                  return Text(
                    data!.title.toString(),
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          )
        ],
      ),
    );
  }
}
