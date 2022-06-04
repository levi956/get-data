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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: FutureBuilder<ServiceResponse?>(
              future: data,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  ServiceResponse? responseData = snapshot.data;

                  // check the status of the service response

                  if (responseData!.status != false) {
                    Info? data = responseData.data;
                    return Text(data!.title.toString());
                  } else {
                    // if false, return service response message [success, or error message]
                    return Text(responseData.message.toString());
                  }
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
