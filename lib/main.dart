import 'package:ave_assignment6/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ContactOrganizerApp());
}

class ContactOrganizerApp extends StatelessWidget {
  const ContactOrganizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(0x5887FF),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          shape: LinearBorder(),
          color: colorScheme.onSecondary,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
      home: ContactsListScreen(),
    );
  }
}