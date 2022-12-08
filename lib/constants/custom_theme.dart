import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTheme {
  ColorScheme lightThemeColorsScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: const Color.fromARGB(255, 111, 0, 255),
      onPrimary: const Color(0xFFFFFFFF),

      // for different card
      primaryContainer: Colors.grey[200],
      onPrimaryContainer: const Color(0xFFFFFFFF),

      secondary: const Color(0xFF000000),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFFFFFFF),
      onSecondaryContainer: const Color(0xFF410000),

      //This container color used for success color
      tertiary: const Color(0xFF38A74C),
      onTertiary: const Color(0xFFFFFFFF),

      //this is color is used for text
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF000000),

      tertiaryContainer: const Color(0xFFFFDAD6),
      onTertiaryContainer: const Color(0xFF410005),
      error: const Color(0xFFB3261E),
      errorContainer: const Color(0xFFF9DEDC),
      onError: const Color(0xFFFFFFFF),
      onErrorContainer: const Color(0xFF410E0B),
      background: const Color(0xFFF9F9F9),
      onBackground: const Color(0xFF1C1B1F),

      surfaceVariant: const Color(0xFFE7E0EC),
      onSurfaceVariant: const Color(0xFF49454F),
      outline: const Color(0xFF000000).withOpacity(0.3),
      onInverseSurface: const Color(0xFFF4EFF4),
      inverseSurface: const Color(0xFF313033),
      inversePrimary: const Color(0xFFFFB3AA),
      shadow: const Color(0xFF000000),
    );
  }

  ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        primaryColor: lightThemeColorsScheme().primary,
        scaffoldBackgroundColor: lightThemeColorsScheme().background,
        colorScheme: lightThemeColorsScheme(),

        //Color setup
        errorColor: lightThemeColorsScheme().error,

        //text Theme
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.sp,
          ),
          bodyText1: TextStyle(
            fontFamily: "Roboto",
            color: lightThemeColorsScheme().onBackground.withOpacity(0.8),
            fontSize: 14.sp,
          ),
          bodyText2: TextStyle(
            fontFamily: "Roboto",
            color: lightThemeColorsScheme().onBackground.withOpacity(0.8),
            fontSize: 14.sp,
          ),
          
          headline2: TextStyle(
            fontSize: 24.sp,
          ),
        ),

        //App Bar Theme data
        appBarTheme: AppBarTheme(
          backgroundColor: lightThemeColorsScheme().primary,
          foregroundColor: lightThemeColorsScheme().onPrimary,
          shadowColor: lightThemeColorsScheme().shadow,
          titleTextStyle: TextStyle(
              color: lightThemeColorsScheme().onPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(
            color: lightThemeColorsScheme().onPrimary,
            size: 22.sp,
          ),
        ),

        //Input decoration theme for
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? lightThemeColorsScheme().error
                  : states.contains(MaterialState.focused)
                      ? lightThemeColorsScheme().primary
                      : lightThemeColorsScheme().onBackground.withOpacity(0.6);
              return TextStyle(
                  color: color, fontFamily: "Roboto", fontSize: 16.sp);
            }),
            //  // isDense: true,
            hintStyle: TextStyle(
              fontFamily: "Roboto",
              color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
              fontSize: 14.sp,
            ),
            errorStyle: TextStyle(
              fontFamily: "Roboto",
              color: lightThemeColorsScheme().error,
              fontSize: 14.sp,
            ),
            suffixStyle: TextStyle(
                fontFamily: "Roboto",
                color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
                fontSize: 14.sp),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
            labelStyle: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14.sp,
              color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightThemeColorsScheme().primary),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: lightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightThemeColorsScheme().error),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            )),

        //Elevated button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: lightThemeColorsScheme().primary,
          foregroundColor: lightThemeColorsScheme().onPrimary,
          textStyle: TextStyle(
            fontSize: 15.sp,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ), // <-- Radius
          ),
        )),

        //outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          //backgroundColor: lightThemeColorsScheme().primary,
          foregroundColor: lightThemeColorsScheme().primary,
          textStyle: TextStyle(
            fontSize: 15.sp,
          ),
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: lightThemeColorsScheme().primary, width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ), // <-- Radius
          ),
        )),

        //Text buttonn theme
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: lightThemeColorsScheme().primary,
          textStyle: TextStyle(
            fontSize: 15.sp,
          ),
        )),

        //Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 10,
            backgroundColor: lightThemeColorsScheme().onPrimary,
            unselectedItemColor:
                lightThemeColorsScheme().primary.withOpacity(0.5),
            selectedItemColor: lightThemeColorsScheme().primary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 22),
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 12)),

        //CheckBox Theme data
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return lightThemeColorsScheme().secondary;
            }
            return lightThemeColorsScheme().onSurface.withOpacity(0.6);
          }),
          checkColor:
              MaterialStateProperty.all(lightThemeColorsScheme().onSecondary),
        ),

        //card Theme
        cardTheme: CardTheme(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: lightThemeColorsScheme().secondary,
            foregroundColor: lightThemeColorsScheme().onSecondary,
            iconSize: 22.sp),
        iconTheme: IconThemeData(size: 25.sp),

        //popup menu button theme
        popupMenuTheme:
            PopupMenuThemeData(color: lightThemeColorsScheme().background),

        //divider theme
        dividerTheme: DividerThemeData(
            color: lightThemeColorsScheme().outline, thickness: 1.0),

        //Bottom modal sheet
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: lightThemeColorsScheme().background,
            elevation: 5.0));
  }

  int getColor(String color) {
    String a = "0xFF${color.substring(1)}";
    return int.parse(a);
  }
}
