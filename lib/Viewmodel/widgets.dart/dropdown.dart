import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final Function(String?) onChanged;

  const Dropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 70,
      child: DropdownButtonFormField<String>(
        value: items.contains(selectedValue) ? selectedValue : null,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 158, 160, 192), width: 1.0),
          ),
        ),
        items: items.map(
          (e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            );
          },
        ).toList(),
        onChanged: (value) {
          onChanged(value);
        },
        validator: (value) => value == null ? 'Please select an option' : null,
      ),
    );
  }
}
