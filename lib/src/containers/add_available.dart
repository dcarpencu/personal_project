import 'package:flutter/material.dart';
import 'package:movie_app/src/models/app_course.dart';
import 'package:movie_app/src/models/available.dart';
import 'package:movie_app/src/widgets/date_picker.dart';
import 'package:movie_app/src/widgets/text_field.dart';
import 'package:movie_app/src/widgets/vaccinated_check_box.dart';

class AddAvailable extends StatefulWidget {
  const AddAvailable({Key? key, required this.course, required this.callback})
      : super(key: key);

  final Course course;
  final Function callback;

  @override
  _AddAvailableState createState() => _AddAvailableState();
}

class _AddAvailableState extends State<AddAvailable> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Course course;
  bool done = false;
  String available = '';
  late DateTime availableDate;

  @override
  void initState() {
    course = widget.course;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Vaccination'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                UserTextField(
                  name: 'available',
                  initialValue: '',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Vaccination Name';
                    }
                  },
                  inputType: TextInputType.text,
                  onChanged: (String? value) {
                    if (value != null) {
                      available = value;
                    }
                  },
                ),
                DatePicker(
                    name: 'Date',
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Vaccination Date';
                      }
                    },
                    onChanged: (DateTime text) {
                      availableDate = text;
                    }),
                AvailableCheckBox(
                    name: 'Given',
                    value: done,
                    onChanged: (bool? text) {
                      done = text ?? done;
                    }),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pop();
                  final Available newAvailable = Available(available,
                      date: availableDate, done: done);
                  course.availables.add(newAvailable);
                }
                widget.callback();
              },
              child: const Text('Add'),),
        ]);
  }
}
