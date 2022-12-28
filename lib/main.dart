import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            allowedViews: const <CalendarView>[
              CalendarView.month,
              CalendarView.week,
              CalendarView.workWeek,
            ],
            firstDayOfWeek: 3,
            dataSource: getCalendarDataSource(),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

_DataSource getCalendarDataSource() {
  final List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
    endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
    subject: 'Release Meeting',
    color: Colors.lightBlueAccent,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
    endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
    subject: 'Performance check',
    color: Colors.amber,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
    subject: 'Support',
    color: Colors.green,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
    subject: 'Retrospective',
    color: Colors.purple,
  ));

  return _DataSource(appointments);
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

