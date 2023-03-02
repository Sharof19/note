import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:notes_app/ui/widgets/notes_body.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Заметки',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.searchIconColor,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.backgroundColor,
          onPressed: () {
            model.controllerClear();
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}
