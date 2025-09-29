import 'package:flutter/material.dart';

// Main function to run the app
void main() {
  runApp(const GuidRegistrationScreen ());
}

// MyApp is the root widget of the application.
class GuidRegistrationScreen extends StatelessWidget {
  const GuidRegistrationScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Become a Guide Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter', // A common clean font, similar to the design
        // Define the default app bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const BecomeAGuideScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The main screen widget for the "Become a Guide" page
class BecomeAGuideScreen extends StatelessWidget {
  const BecomeAGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
            // In a real app, this would likely be Navigator.pop(context);
          },
        ),
        title: const Text('Become a Guide'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to prevent overflow on smaller screens
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The main illustration at the top
              Center(
                child: Image.asset(
                  'assets/online-world.png', // IMPORTANT: Make sure this path is correct
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    // Show a placeholder if the image fails to load
                    return Container(
                      height: 180,
                      width: 250,
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Image not found at\nassets/online-world.png',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Form fields
              _buildTextField(label: 'Full Name', hint: 'Enter full name'),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Phone Number',
                hint: 'Enter phone number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Email',
                hint: 'm@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Upload buttons
              _buildUploadButton(label: 'Upload Business Logo'),
              const SizedBox(height: 16),
              _buildUploadButton(label: 'Upload Business Registration'),
            ],
          ),
        ),
      ),
      // The bottom navigation bar holds the "Continue" button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle continue action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFF4A90E2,
            ), // A nice blue color from the design
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text('Continue', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  // Helper widget for creating text fields to reduce code duplication
  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF4A90E2), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  // Helper widget for creating the upload buttons
  Widget _buildUploadButton({required String label}) {
    return OutlinedButton(
      onPressed: () {
        // Handle upload action
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black54,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey.shade300),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        padding: EdgeInsets.zero, // Remove default padding
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                'assets/icons/Foled_up_fill.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          Center(child: Text(label)),
        ],
      ),
    );
  }
}
