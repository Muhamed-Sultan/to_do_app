import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

enum Status { pending, completed, inProgress, notStarted }

class StatusDropDown extends StatelessWidget {
  final void Function(String?)? onChanged;

  const StatusDropDown({super.key, this.onChanged});

  String getStatusText(Status status) {
    switch (status) {
      case Status.pending:
        return LocaleKeys.pending.tr();

      case Status.completed:
        return LocaleKeys.completed.tr();

      case Status.inProgress:
        return LocaleKeys.inProgress.tr();

      case Status.notStarted:
        return LocaleKeys.notStarted.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade300,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: LocaleKeys.chooseStatus.tr(),
      ),

      items: Status.values.map((status) {
        return DropdownMenuItem<String>(
          value: status.name,
          child: Text(getStatusText(status)),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}
