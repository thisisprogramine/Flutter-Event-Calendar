import 'package:event_calender_app/core/utils/utils.dart';
import 'package:event_calender_app/data/model/event_model.dart';
import 'package:event_calender_app/presentation/screens/event_edit_page.dart';
import 'package:event_calender_app/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewPage extends StatelessWidget {
  final Event event;

  const EventViewPage({
    Key? key,
    required this.event
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder) => EventEditPage(event: event,)));
              },
              icon: const Icon(Icons.edit)
          ),

          IconButton(
              onPressed: () {
                final provider = Provider.of<EventProvider>(context, listen: false);
                provider.deleteEvent(event);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          buildDateTime(event),
          const SizedBox(height: 32,),
          Text(event.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text(event.description, style: const TextStyle(color: Colors.white, fontSize: 18),)
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate('From', event.from),
        const SizedBox(height: 10,),
        buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Row(
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 18),),
        Expanded(child: Container(),),
        Text('${Utils.toDate(date)} ${Utils.toTime(date)}', style: const TextStyle(fontSize: 14))
      ],
    );

  }
}
