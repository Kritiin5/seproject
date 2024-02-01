import 'package:flutter/material.dart';
import 'routes.dart';

class UserAgreementPage extends StatefulWidget {
  const UserAgreementPage({Key? key}) : super(key: key);

  @override
  State<UserAgreementPage> createState() => _UserAgreementPageState();
}

class _UserAgreementPageState extends State<UserAgreementPage> {
  bool terms_conditions = false;
  bool privacy_policy = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Terms and Conditions",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "By accessing and using our services, you agree to abide by these terms and conditions. Users are responsible for the confidentiality of their account information and are prohibited from engaging in any unlawful activities on our platform. We reserve the right to modify or terminate services at our discretion, and users are encouraged to review these terms regularly for updates.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Privacy Policy",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(
                "We prioritize the privacy of our users and assure the confidentiality of personal information collected on our platform. The data we gather is used solely for the purpose of improving our services and enhancing user experience. We do not share, sell, or disclose any user information to third parties without explicit consent.",
                style: TextStyle(
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                    value: terms_conditions,
                    onChanged: (bool? value) {
                      setState(() {
                        terms_conditions = value!;
                      });
                    }),
                Text("I agree to the Terms and Condition"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: privacy_policy,
                    onChanged: (bool? value) {
                      setState(() {
                        privacy_policy = value!;
                      });
                    }),
                Text("I agree to the Privacy Policy"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (terms_conditions && privacy_policy) {
                    Navigator.pushReplacementNamed(context, Routes.signUp);
                  }
                },
                child: Text(
                  "Continue",
                  style: terms_conditions && privacy_policy
                      ? TextStyle(color: Colors.black)
                      : TextStyle(color: Colors.grey),
                ))
          ]),
    ));
  }
}
