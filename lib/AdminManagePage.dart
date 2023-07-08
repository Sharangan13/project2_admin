import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Manage Plants and Equipment'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Plants'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminPlantCategoriesPage()),
              );
            },
          ),
          ListTile(
            title: Text('Equipment'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminEquipmentPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AdminPlantCategoriesPage extends StatelessWidget {
  final List<String> plantCategories = [
    'Indoor Plants',
    'Outdoor Plants',
    'Flowering Plants',
    'Medicinal Plants',
    'Rare and Exotic Plants',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Plant Categories'),
      ),
      body: ListView.builder(
        itemCount: plantCategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(plantCategories[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminPlantDetailsPage(
                        category: plantCategories[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class AdminPlantDetailsPage extends StatelessWidget {
  final String category;

  AdminPlantDetailsPage({required this.category});

  // Add logic to update plant details here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Plant Details'),
      ),
      body: Center(
        child: Text(
          'Category: $category',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class AdminEquipmentPage extends StatelessWidget {
  // Add logic to display and update equipment details here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Equipment'),
      ),
      body: Center(
        child: Text(
          'Admin Equipment Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
