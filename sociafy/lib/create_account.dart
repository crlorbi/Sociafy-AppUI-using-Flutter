import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Account',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blueGrey, // Set text color of app bar title
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blueGrey), // Set icon color of app bar
        elevation: 0, // Remove elevation for a flat design
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white], // Ensure both colors are the same for a solid background
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                  hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  prefixIcon: const Icon(FontAwesomeIcons.user, color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.blueGrey, fontFamily: 'Poppins'), // Set text color to a visible color
                cursorColor: Colors.blueGrey,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  prefixIcon: const Icon(FontAwesomeIcons.user, color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.blueGrey, fontFamily: 'Poppins'), // Set text color to a visible color
                cursorColor: Colors.blueGrey,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  prefixIcon: const Icon(FontAwesomeIcons.solidEnvelope, color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.blueGrey, fontFamily: 'Poppins'), // Set text color to a visible color
                cursorColor: Colors.blueGrey,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  prefixIcon: const Icon(FontAwesomeIcons.lock, color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.blueGrey, fontFamily: 'Poppins'), // Set text color to a visible color
                cursorColor: Colors.blueGrey,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // Implement account creation logic here
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreateAccountPage(),
  ));
}
