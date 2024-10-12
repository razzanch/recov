import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: Column(
                children: [
                  Image.asset('assets/LOGO.png', height: 100), // Adjust the path if needed
                  SizedBox(height: 30),

                  // App Name
                  Text(
                    "Kaza Kopi Nusantara",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Login Text
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Email TextField
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter your password',
              ),
            ),

            SizedBox(height: 20),

            // Forgot Password Link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                String email = controller.emailController.text;
                String password = controller.passwordController.text;

                // Check if the user is admin
                if (email == 'admin' && password == 'admin') {
                  Get.toNamed(Routes.STOCK); // Redirect to Admin route
                } else {
                  Get.toNamed(Routes.HOME); // Redirect to User route
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800], // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}