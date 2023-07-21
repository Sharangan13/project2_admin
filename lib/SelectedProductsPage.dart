import 'package:flutter/material.dart';

import 'Product.dart';

class SelectedProductsPage extends StatefulWidget {
  final List<Product> selectedProducts;

  SelectedProductsPage({required this.selectedProducts});

  @override
  _SelectedProductsPageState createState() => _SelectedProductsPageState();
}

class _SelectedProductsPageState extends State<SelectedProductsPage> {
  double _discountPercentage = 0.0;
  double _totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.selectedProducts.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.selectedProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.selectedProducts[index];
                  return ListTile(
                    leading: Image.network(product
                        .imageURL), // Assuming you have a photo URL in the Product model
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: Rs ${product.price.toStringAsFixed(2)}'),
                        Text('Quantity: ${product.quantity}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.selectedProducts.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showDiscountDialog();
                  },
                  child: Text('Add Discount'),
                ),
                ElevatedButton(
                  onPressed: _calculateTotalAmount,
                  child: Text('Calculate Total Amount'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Center(
              child: Container(
                child: Text('Total Amount: Rs $_totalAmount',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
            Center(
              child: Container(
                child: Text('Discount Percentage: $_discountPercentage%',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Total Amount with Discount: Rs ${_totalAmountWithDiscount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Payment Complete'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDiscountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        double selectedDiscount = _discountPercentage;
        return AlertDialog(
          title: Text('Add Discount Percentage'),
          content: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              selectedDiscount = double.tryParse(value) ?? 0.0;
            },
            decoration: InputDecoration(labelText: 'Discount Percentage (%)'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _discountPercentage = selectedDiscount;
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _calculateTotalAmount() {
    double total = 0.0;
    for (final product in widget.selectedProducts) {
      total += product.price * product.quantity;
    }
    _totalAmount = total;
    setState(() {});
  }

  double get _totalAmountWithDiscount {
    return _totalAmount - (_totalAmount * (_discountPercentage / 100));
  }
}
