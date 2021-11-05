import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar.dart';
import 'package:mobile/screens/sale/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        buttonText: 'Save',
        onActionPress: () {
          print('Hii bro');
        },
        text: 'Dashboard',
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SaleScreen()));
            },
            child: Card(
              color: Colors.green[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Sale')],
              ),
            ),
          )
        ],
      ),
    );
  }
}
