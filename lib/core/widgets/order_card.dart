import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({required this.order, super.key});

  @override
  Widget build(BuildContext ctx) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical:8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow:[]),
          child: Row(
            children:[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(order.dateLabel, style: TextStyle(fontSize:12,color:Colors.grey)),
                    SizedBox(height:8),
                    Text(order.title, style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height:8),
                    Row(children:[ Icon(Icons.place, size:14, color:Colors.green), Text(order.location) ]),
                  ]
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  Text('\$${order.price.toStringAsFixed(2)}', style: TextStyle(color:Colors.red, fontWeight: FontWeight.bold)),
                ],
              )
            ]
          )
        ),
        // Status badge (positioned)
        Positioned(
          right: 0,
          top: 12,
          child: RotatedBox(
            quarterTurns: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:12, vertical:6),
              decoration: BoxDecoration(color: order.statusColor, borderRadius: BorderRadius.circular(6)),
              child: Text(order.statusLabel, style: TextStyle(color:Colors.white)),
            ),
          ),
        )
      ]
    );
  }
}
