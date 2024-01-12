import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_editor/providers/edit_provider.dart';
import 'package:image_editor/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(392.7, 872.7),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => EditProvider())
        ],
        child: MaterialApp(
          title: 'Editor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: 'home',
          routes: {
            'home': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
