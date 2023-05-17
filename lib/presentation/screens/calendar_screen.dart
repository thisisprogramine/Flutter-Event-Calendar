import 'package:event_calender_app/data/data_source/event_data_source.dart';
import 'package:event_calender_app/presentation/screens/event_edit_page.dart';
import 'package:event_calender_app/presentation/widgets/task_widget.dart';
import 'package:event_calender_app/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.white,
        monthViewSettings: const MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        onTap: (details) {
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const EventEditPage()));
        },

        onLongPress: (detail) {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.setDate(detail.date!);
          showModalBottomSheet(
            context: context,
            builder: (context) => const TaskWidget(),
          );
        },

      ),
    );
  }
}
