import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotesPage extends StatelessWidget {
  const ChangeNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({super.key});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;
    
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormFieldWidget(
            textEditingController: model.titleController,
            hintText: 'Заголовок',
            labelText: 'Заголовок',
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            textEditingController: model.textController,
            hintText: 'Заметки',
            labelText: 'Заметки',
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              heroTag: 'notes-change-btn',
              elevation: 2,
              backgroundColor: AppColors.backgroundColor,
              onPressed: () {
                model.onChangeNote(context, index);
              },
              label: Text(
                'Изменить',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
  });

  final String labelText, hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.textGrey,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textGrey,
        ),
        hintText: hintText,
        hintStyle: AppStyle.fontStyle.copyWith(fontSize: 16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}