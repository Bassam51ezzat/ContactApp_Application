import 'package:flutter/material.dart';
import 'package:new_contacts_app/models/contact_model.dart';
import 'package:new_contacts_app/widgets/add_contact_bottom_sheet.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_floating_action_button_widget.dart';
import '../widgets/placeholder_widget.dart';
import '../widgets/screen_contacts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [
    ContactModel(
        userName: 'Jane Smith',
        phone: '+1 9876543210',
        email: 'jane.smith@example.com',
        imageFile: null),
    ContactModel(
        userName: 'Jane Smith',
        phone: '+1 9876543210',
        email: 'jane.smith@example.com',
        imageFile: null),
    ContactModel(
        userName: 'Jane Smith',
        phone: '+1 9876543210',
        email: 'jane.smith@example.com',
        imageFile: null),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(AppImages.logo),
        ),
        leadingWidth: width * 0.3,
      ),
      body: contacts.isEmpty
          ? const PlaceholderWidget()
          : ScreenContacts(
              contacts: contacts, onContactDeleteClicked: deleteContactByIndex),
      floatingActionButton: CustomFloatingActionButtonWidget(
        showDelete: contacts.isNotEmpty,
        addContactFun: showModalBottomSheetFun,
        deleteContactFun: deleteContact,
      ),
    );
  }

  void showModalBottomSheetFun(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddContactBottomSheet(
          contacts: contacts,
          onContactAdd: () {
            setState(() {});
          },
        );
      },
    );
  }

  void deleteContact() {
    contacts.removeLast();
    setState(() {});
  }

  void deleteContactByIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }
}
