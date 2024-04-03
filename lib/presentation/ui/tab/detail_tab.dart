// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_uis/data/education_data.dart';
import 'package:just_uis/data/skill.dart';
import 'package:just_uis/data/work_data.dart';
import 'package:just_uis/presentation/ui/project/add_project.dart';

class DetailTab extends StatefulWidget {
  const DetailTab({super.key});

  @override
  State<DetailTab> createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  List<Work> workExperiences = [];
  bool showAllWorkExperiences = false;
  List<Education> educationExp = [];
  bool showAllEduExperiences = false;
  List<Skill> skills = [];
  List<Skill> softSkills = [];


  double calculateListViewHeight() {
    final double listItemHeight = 70.0; // Height of each list item
    final int maxVisibleItems = 2; // Maximum number of visible items without scrolling
    final int totalItems = workExperiences.length;
    final int visibleItems = showAllWorkExperiences ? totalItems : min(totalItems, maxVisibleItems);
    final double listViewHeight = visibleItems * listItemHeight;

    // Add some extra padding (10.0) at the bottom for better spacing
    return listViewHeight + 10.0;
  }

  double calculateListViewEduHeight() {
    final double listItemHeight = 70.0; // Height of each list item
    final int maxVisibleItems = 2; // Maximum number of visible items without scrolling
    final int totalItems = educationExp.length;
    final int visibleItems = showAllEduExperiences ? totalItems : min(totalItems, maxVisibleItems);
    final double listViewHeight = visibleItems * listItemHeight;

    // Add some extra padding (10.0) at the bottom for better spacing
    return listViewHeight + 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Projects',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => AddProjectScreen()));
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
      
            // Work Experince
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Work Experience',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _showAddExperienceBottomSheet(context);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
            if (workExperiences.isEmpty)
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF357F8B),
                    backgroundImage: AssetImage('assets/pfp_nameholder.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Add your first work experience '),
                ],
              ),
            SizedBox(height: 8),
            SizedBox(
              height: calculateListViewHeight(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: showAllWorkExperiences
                    ? workExperiences.length
                    : min(workExperiences.length, 2), // Display only first two or all if showing all
                itemBuilder: (context, index) {
                  return ListTile(
                    // List item widget...
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF357F8B),
                      backgroundImage: AssetImage('assets/pfp_nameholder.png'),
                    ),
                    title: Row(
                      children: [
                        Text(workExperiences[index].companyName),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(Icons.circle, size: 10),
                        ),
                        Text(workExperiences[index].jobRole),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(workExperiences[index].timeDuration),
                        Text(workExperiences[index].location),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Show More button if there are more than two work experiences
            if (workExperiences.length > 2)
              TextButton(
                onPressed: () {
                  setState(() {
                    showAllWorkExperiences = !showAllWorkExperiences;
                  });
                },
                child: Text(
                  showAllWorkExperiences ? 'Show Less' : 'Show More',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
      
      
            //   Education
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Education',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _showAddEducationBottomSheet(context);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
            if (educationExp.isEmpty)
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF357F8B),
                    backgroundImage: AssetImage('assets/pfp_nameholder.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Add your first work experience '),
                ],
              ),
            SizedBox(height: 20),
            SizedBox(
              height: calculateListViewEduHeight(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: showAllWorkExperiences
                    ? educationExp.length
                    : min(educationExp.length, 2),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF357F8B),
                      backgroundImage: AssetImage('assets/pfp_nameholder.png'),
                    ),
                    title: Text(educationExp[index].instName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(educationExp[index].type),
                        Row(
                          children: [
                            Text(educationExp[index].locations),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(Icons.circle, size: 10),
                            ),
                            Text(educationExp[index].timeDurations),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (educationExp.length > 2)
              TextButton(
                onPressed: () {
                  setState(() {
                    showAllEduExperiences = !showAllEduExperiences;
                  });
                },
                child: Text(
                  showAllEduExperiences ? 'Show Less' : 'Show More',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
      
            //   Skills
            Text(
              'My Skillset',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Hard Skills
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hard Skills',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _showAddHardSkillsBottomSheet(context);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            // Container(
            //   child: Expanded(
            //     child: ListView.builder(
            //       itemCount: skills.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: Text(skills[index].skillName),
            //         );
            //       },
            //     ),
            //   ),
            // ),
      
            //   Soft Skills
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Soft Skills',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _showAddSoftSkillsBottomSheet(context);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            // Container(
            //   child: Expanded(
            //     child: ListView.builder(
            //       itemCount: skills.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: Text(skills[index].skillName),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // experince
  void _showAddExperienceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddWorkExperience();
      },
    ).then((newWorkExperience) {
      if (newWorkExperience != null) {
        setState(() {
          workExperiences.add(newWorkExperience);
        });
      }
    });
  }

  // Education
  void _showAddEducationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddEducationExperience();
      },
    ).then((newEduExperience) {
      if (newEduExperience != null) {
        setState(() {
          educationExp.add(newEduExperience);
        });
      }
    });
  }

  // Skills
  void _showAddHardSkillsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddHardSkills();
      },
    ).then((newHardExperience) {
      if (newHardExperience != null) {
        setState(() {
          skills.add(newHardExperience);
        });
      }
    });
  }

  void _showAddSoftSkillsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddSoftSkills();
      },
    ).then((newSoftExperience) {
      if (newSoftExperience != null) {
        setState(() {
          skills.add(newSoftExperience);
        });
      }
    });
  }
}

// Experinces
class AddWorkExperience extends StatefulWidget {
  @override
  _AddWorkExperienceState createState() => _AddWorkExperienceState();
}

class _AddWorkExperienceState extends State<AddWorkExperience> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();
  TextEditingController timeDurationController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: companyNameController,
            decoration: const InputDecoration(
              labelText: 'Company Name',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: jobRoleController,
            decoration: const InputDecoration(
              labelText: 'Job Role',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: timeDurationController,
            decoration: const InputDecoration(
              labelText: 'Time Duration',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Location',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                Work(
                    companyName: companyNameController.text,
                    jobRole: jobRoleController.text,
                    timeDuration: timeDurationController.text,
                    location: locationController.text),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// EDucation
class AddEducationExperience extends StatefulWidget {
  @override
  _AddEducationExperienceState createState() => _AddEducationExperienceState();
}

class _AddEducationExperienceState extends State<AddEducationExperience> {
  TextEditingController instNameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController timeDurationsController = TextEditingController();
  TextEditingController locationsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: instNameController,
            decoration: const InputDecoration(
              labelText: 'School/College Name',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: typeController,
            decoration: const InputDecoration(
              labelText: 'Education',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: timeDurationsController,
            decoration: const InputDecoration(
              labelText: 'Time Duration',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: locationsController,
            decoration: const InputDecoration(
              labelText: 'Location',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                Education(
                    instName: instNameController.text,
                    type: typeController.text,
                    timeDurations: timeDurationsController.text,
                    locations: locationsController.text),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Skills
class AddHardSkills extends StatefulWidget {
  @override
  _AddHardSkillsState createState() => _AddHardSkillsState();
}

class _AddHardSkillsState extends State<AddHardSkills> {
  TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: skillsController,
            decoration: const InputDecoration(
              labelText: 'Skills',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                Skill(
                  skillName: skillsController.text,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddSoftSkills extends StatefulWidget {
  @override
  _AddSoftSkillsState createState() => _AddSoftSkillsState();
}

class _AddSoftSkillsState extends State<AddSoftSkills> {
  TextEditingController softSkillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: softSkillController,
            decoration: const InputDecoration(
              labelText: 'Skills',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
                Skill(
                  skillName: softSkillController.text,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// if (workExperiences.isEmpty)
// Row(
// children: [
// CircleAvatar(
// backgroundColor: Color(0xFF357F8B),
// backgroundImage: AssetImage('assets/pfp_nameholder.png'),
// ),
// SizedBox(
// width: 10,
// ),
// Text('Add your first work experience '),
// ],
// ),
// SizedBox(height: 20),
// Expanded(
// child: ListView.builder(
// itemCount: workExperiences.length,
// itemBuilder: (context, index) {
// return ListTile(
// leading: CircleAvatar(
// backgroundColor: Color(0xFF357F8B),
// backgroundImage: AssetImage('assets/pfp_nameholder.png'),
// ),
// title: Row(
// children: [
// Text(workExperiences[index].companyName),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 6),
// child: Icon(Icons.circle, size: 10),
// ),
// Text(workExperiences[index].jobRole),
// ],
// ),
// subtitle: Column(
// children: [
// Text(workExperiences[index].timeDuration),
// Text(workExperiences[index].location),
// ],
// ),
// );
// },
// ),
// ),