import 'package:flutter/material.dart';

import 'package:resume_creator/resume_creator/imagepicker.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});
  @override
  State<PersonalDetails> createState() {
    return _PersonalDetailsState();
  }
}

class _PersonalDetailsState extends State<PersonalDetails> {
  var formkey = GlobalKey<FormState>();
  void resetForm() {
    setState(() {
      nameController.clear();
      adressController.clear();
      emailController.clear();
      phoneController.clear();
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 23.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Text('Personal Details'),
                Text('Help'),
              ],
            ),
            title: const Text('Personal details'),
          ),
          body: TabBarView(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 7),
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: 'Name',
                          labelStyle: const TextStyle(fontSize: 13),
                          prefixIcon: Container(
                            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      height: 90,
                      child: TextFormField(
                        maxLines: 5,
                        textInputAction: TextInputAction.next,
                        controller: adressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: 'Address',
                          labelStyle: const TextStyle(fontSize: 13),
                          prefixIcon: Container(
                            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: 'Email',
                          labelStyle: const TextStyle(fontSize: 13),
                          prefixIcon: Container(
                            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Phone Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: 'Phone',
                          labelStyle: const TextStyle(fontSize: 13),
                          prefixIcon: Container(
                            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const Picker(),
                          ),
                        );
                      },
                      child: const Text('Upload Image'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {}
                          },
                          child: const Text('Add Details'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            resetForm();
                          },
                          child: const Text('Reset Details'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Text('How can I help You?'),
            ],
          ),
        ),
      ),
    );
  }
}
