import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String _timeString = '';
  String _zoneString = 'WIB';

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime utc = DateTime.now().toUtc();
    final DateTime localTime = utc.add(_getOffset(_zoneString));
    final String formattedLocalTime = _formatDateTime(localTime);
    if (this.mounted) {
      setState(() {
        _timeString = formattedLocalTime;
      });
    }
  }

  Duration _getOffset(String zone) {
    switch (zone) {
      case 'WITA':
        return const Duration(hours: 8);
      case 'WIT':
        return const Duration(hours: 9);
      default:
        return const Duration(hours: 7);
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(_timeString, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_zoneString == 'WIB')
                        _zoneString = 'WITA';
                      else if (_zoneString == 'WITA')
                        _zoneString = 'WIT';
                      else
                        _zoneString = 'WIB';
                    });
                  },
                  child: Text(_zoneString))
            ],
          ),
          SizedBox(height: 10),
          Container(
              child: SfCalendar(
            view: CalendarView.month,
            // dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            ),
          ))
        ],
      ),
    ));
  }
}
