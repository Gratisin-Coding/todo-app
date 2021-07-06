import 'package:flutter/material.dart';
import 'home_page.dart';

const IMAGE_URL =
    'https://upload.wikimedia.org/wikipedia/commons/4/44/Google-flutter-logo.svg';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('https://picsum.photos/250?image=9'),
          Text(
            "Gratisin Coding",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            width: double.infinity,
          ),
          TextButton(
            child: Text("Get Started"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
