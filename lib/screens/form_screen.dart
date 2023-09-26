import 'package:e_waste_app/screens/mapScreen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String bodyType = 'plastic';
  String partsProper = 'yes';
  String name = '';
  String serialNumber = '';
  String brandName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  "Fill your product information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                value: bodyType,
                items: ['plastic', 'metal', 'other']
                    .map((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    bodyType = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Body Type'),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: partsProper,
                items: ['yes', 'no']
                    .map((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    partsProper = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Parts Proper'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Serial Number'),
                onChanged: (value) {
                  serialNumber = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Brand Name'),
                onChanged: (value) {
                  brandName = value;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(
                          formData: {
                            'bodyType': bodyType,
                            'partsProper': partsProper,
                            'name': name,
                            'serialNumber': serialNumber,
                            'brandName': brandName,
                          },
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Proceed to Hub',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the value for slight roundness
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  NextScreen({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Body Type: ${formData['bodyType']}',
                style: TextStyle(color: Colors.black)),
            Text('Parts Proper: ${formData['partsProper']}',
                style: TextStyle(color: Colors.black)),
            Text('Name: ${formData['name']}',
                style: TextStyle(color: Colors.black)),
            Text('Serial Number: ${formData['serialNumber']}',
                style: TextStyle(color: Colors.black)),
            Text('Brand Name: ${formData['brandName']}',
                style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
