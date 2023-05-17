import 'package:event_calender_app/presentation/screens/calendar_screen.dart';
import 'package:event_calender_app/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventCalendarApp extends StatefulWidget {
  const EventCalendarApp({
    Key? key,
  }) : super(key: key);

  @override
  _EventCalendarAppState createState() => _EventCalendarAppState();
}

class _EventCalendarAppState extends State<EventCalendarApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Calendar App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColorLight: Colors.white,
        ),
        home: CalendarScreen(),
      ),
    );
  }
}
