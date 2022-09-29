import 'package:flutter/material.dart';
import 'package:hackatec/services/artesanos_service.dart';
import 'package:hackatec/styles.dart';
import 'package:provider/provider.dart';

import '../helpers/multiselect.dart';
import '../services/maps_service.dart';
import 'maps.dart';

// Create a Form widget.
class RegisterCraftsman extends StatefulWidget {
  const RegisterCraftsman({super.key});

  @override
  RegisterCraftsmanState createState() {
    print("ATTEMPT");
    return RegisterCraftsmanState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class RegisterCraftsmanState extends State<RegisterCraftsman> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedItems = [];

  late String name, lastName;

  List<String> list = <String>['male', 'female'];
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            children: [
              const Text("REGISTRAR ARTESANO",
                  style: TextStyle(fontSize: 36.0)),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ORANGE_MAIN, width: 1.0)),
                        hintText: 'Nombre',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el nombre';
                        }
                        name = value;
                        return null;
                      },
                    ),
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ORANGE_MAIN, width: 1.0)),
                        hintText: 'Apellidos',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese los apellidos';
                        }
                        lastName = value;
                        return null;
                      },
                    ),
                    DropdownButton<String>(
                      value: gender,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          gender = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      child: const Text('Seleccionar Productos'),
                      onPressed: _showMultiSelect,
                    ),
                    ElevatedButton(
                      child: const Text('Seleccionar Ubicacion'),
                      onPressed: _showMap,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            if (context.read<MapProvider>().hasCoords) {
                              print(context.read<MapProvider>().getCoords()[0]);
                              print(",");
                              print(context.read<MapProvider>().getCoords()[1]);
                            } else {
                              print("NO LOCATION SELECTED!");
                              return;
                            }

                            context.read<ArtesanoService>().register(
                                name,
                                lastName,
                                gender,
                                context.read<MapProvider>().getCoords());

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text(
                          'REGISTRAR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPicker()
          // builder: (context) => PlacePicker(
          //   apiKey: 'AIzaSyAahYjYKiz6_BfHWKFAJBLIVeZSQ8nYLOs',
          //   onPlacePicked: (result) {
          //     print(result);
          //     Navigator.of(context).pop();
          //   },
          //   initialPosition: RegisterCraftsmanState.kInitialPosition,
          //   useCurrentLocation: true,
          //   resizeToAvoidBottomInset:
          //       false, // remove this line, if map offsets are wrong
          // ),
          ),
    );
  }

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Hamacas',
      'Vasijas',
      'Jarrones',
      'Estatuas',
      'Piñatas',
      'Sombreros'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }
}
