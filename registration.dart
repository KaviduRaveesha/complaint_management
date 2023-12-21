import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:untitled11/auth_service.dart'; // Import the AuthService
import 'package:untitled11/form-test.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService(); // Instantiate the AuthService

  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        border: OutlineInputBorder(),
      ),
      maxLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email cannot be empty';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }

  Widget _buildIdField() {
    return TextFormField(
      controller: idController,
      decoration: InputDecoration(
        hintText: 'Enter NIC',
        border: OutlineInputBorder(),
      ),
      maxLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIC cannot be empty';
        }
        return null;
      },
      onSaved: (value) {},
    );
  }

  Widget _buildPasswordField() {
    return PasswordField(
      controller: passwordController,
      color: Colors.blue,
      passwordConstraint: r'.*[@$#.*].*',
      hintText: 'Create Password',
      border: PasswordBorder(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2, color: Colors.red.shade200),
        ),
      ),
      errorMessage: 'must contain special character either . * @ # \$',
    );
  }

  Widget _buildConfirmPasswordField() {
    return PasswordField(
      controller: confirmPasswordController,
      color: Colors.blue,
      passwordConstraint: r'.*[@$#.*].*',
      hintText: 'Confirm Password',
      border: PasswordBorder(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2, color: Colors.red.shade200),
        ),
      ),
      errorMessage: 'must contain special character either . * @ # \$',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Set the text to bold
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                _buildIdField(),
                SizedBox(
                  height: 20,
                ),
                _buildEmailField(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordField(),
                SizedBox(
                  height: 20,
                ),
                _buildConfirmPasswordField(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // Call the register method from your AuthService
                        bool isRegistered = await authService.register(
                          emailController.text,
                          idController.text,
                          passwordController.text,
                        );

                        if (isRegistered) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormTest()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registration failed')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set the background color here
                      onPrimary: Colors.white, // Set the text color here
                      elevation: 5, // Elevation (shadow) of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ), // Rounded corners
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
