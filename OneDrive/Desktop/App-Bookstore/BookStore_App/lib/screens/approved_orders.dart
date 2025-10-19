import 'package:flutter/material.dart';
import 'package:flutter_project_2303e/models/order.dart';

  class ApprovedOrderPage extends StatelessWidget {
    final Order order;
  static const String routeName = '/ApprovedOrderPage';  // Add this line

  const ApprovedOrderPage({super.key, required this.order});
  
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approved Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Order Date: ${order.orderDate}'),
            Text('Amount: NFT ${order.amount}'),
            Text('Status: ${order.status}'),
            // Display more details as needed
          ],
        ),
      ),
    );
  }
}



