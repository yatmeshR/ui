import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';



class Project {
  final String name;
  final String description;
  final String type;
  final File image;

  Project({required this.name, required this.description, required this.type, required this.image});
}



class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projects = [];

  void addProject(File image, String name, String description, String type) {
    setState(() {
      projects.add(Project(image: image, name: name, description: description, type: type));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: projects.isEmpty
          ? Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProjectPage(onAddProject: addProject)),
            );
          },
          child: Text('Add Project'),
        ),
      )
          : projects.length <= 4
          ? ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index].name),
            subtitle: Text(projects[index].description),
            leading: Image.file(projects[index].image),
          );
        },
      )
          : CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: projects.map((project) {
          return Builder(
            builder: (BuildContext context) {
              return ListTile(
                title: Text(project.name),
                subtitle: Text(project.description),
                leading: Image.file(project.image),
              );
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProjectPage(onAddProject: addProject)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddProjectPage extends StatefulWidget {
  final Function(File, String, String, String) onAddProject;

  AddProjectPage({required this.onAddProject});

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
   late File _image;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: getImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _image != null ? Image.file(_image, fit: BoxFit.cover) : Icon(Icons.add),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Project Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter project name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Project Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter project description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Project Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter project type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAddProject(_image, _nameController.text, _descriptionController.text, _typeController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_image', _image));
  }
}
