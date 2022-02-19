import 'package:flutter/material.dart';

import '../models/data_model.dart';

class DetailsPage extends StatelessWidget {
  final DataModel dataModel;

  const DetailsPage({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}
