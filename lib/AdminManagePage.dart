import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Management'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminPlantCategoriesPage(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Plants',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminEquipmentPage(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Equipment',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
        title: Text('Plant Categories'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0, // Add a small gap between columns
          mainAxisSpacing: 10.0, // Add a small gap between rows
          children: List.generate(plantCategories.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPlantDetailsPage(
                      category: plantCategories[index],
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context).primaryColor.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      plantCategories[index],
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AdminPlantDetailsPage extends StatelessWidget {
  final String category;

  AdminPlantDetailsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Details'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Category: $category',
                style: TextStyle(fontSize: 18),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Plants')
                  .doc(category.replaceAll(' ', ''))
                  .collection('Items')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final plants = snapshot.data!.docs;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    final plant = plants[index];
                    final name = plant['name'];
                    final imgUrl = plant['image_url'];
                    final price = plant['price'];
                    final quantity = plant['quantity'];

                    return GestureDetector(
                      onTap: () {
                        // Handle plant details click
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imgUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Price: $price',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Quantity: $quantity',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Handle update plant details
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete $name'),
                                          content: Text(
                                            'Are you sure you want to delete this plant?',
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Delete'),
                                              onPressed: () {
                                                // Handle delete plant details
                                                FirebaseFirestore.instance
                                                    .collection('Plants')
                                                    .doc(category.replaceAll(
                                                        ' ', ''))
                                                    .collection('Items')
                                                    .doc(plant
                                                        .id) // Assuming the document ID is available as `plant.id`
                                                    .delete()
                                                    .then((value) {
                                                  // Successfully deleted the plant details
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                }).catchError((error) {
                                                  // Error occurred while deleting the plant details
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminEquipmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Equipment Details',
                style: TextStyle(fontSize: 18),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Equipments')
                  .doc('equipments')
                  .collection('Items')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final equipments = snapshot.data!.docs;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: equipments.length,
                  itemBuilder: (context, index) {
                    final equipment = equipments[index];
                    final name = equipment['name'];
                    final imgUrl = equipment['image_url'];
                    final price = equipment['price'];
                    final quantity = equipment['quantity'];

                    return GestureDetector(
                      onTap: () {
                        // Handle equipment details click
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                imgUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(name,
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Handle update equipment details
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              Text('Delete Equipment Details'),
                                          content: Text(
                                              'Are you sure you want to delete this equipment?'),
                                          actions: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Delete'),
                                              onPressed: () {
                                                // Handle delete equipment details
                                                FirebaseFirestore.instance
                                                    .collection('Equipments')
                                                    .doc('equipments')
                                                    .collection('Items')
                                                    .doc(equipment
                                                        .id) // Assuming the document ID is available as `equipment.id`
                                                    .delete()
                                                    .then((value) {
                                                  // Successfully deleted the equipment details
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                }).catchError((error) {
                                                  // Error occurred while deleting the equipment details
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
