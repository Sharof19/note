import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({
    super.key,
    required this.title,
    required this.text,
    required this.index,
  });

  final String title, text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                AppRoutes.changeNotes,
                arguments: index,
              );
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.textGrey,
            ),
            label: Text(
              'Редактировать',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          DeleteNoteWidget(
            index: index,
          ),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return TextButton.icon(
      onPressed: () {
        model.onDeleteNote(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.textGrey,
      ),
      label: Text(
        'Удалить',
        style: AppStyle.fontStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
