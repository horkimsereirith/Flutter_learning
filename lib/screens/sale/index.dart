import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_bar.dart';
import 'package:mobile/model/sale_model.dart';
import 'package:mobile/widgets/input_container.dart';

const List<Tab> tabs = <Tab>[Tab(text: "Info"), Tab(text: "Product")];
List<FacebookPage> _facebookPages = [
  FacebookPage(id: '001', name: 'Page 1'),
  FacebookPage(id: '002', name: 'Page 2'),
  FacebookPage(id: '003', name: 'Page 3')
  // FacebookPage(id: '004', name: 'Page 4'),
  // FacebookPage(id: '005', name: 'Page 5'),
  // FacebookPage(id: '006', name: 'Page 6'),
  // FacebookPage(id: '007', name: 'Page 7'),
  // FacebookPage(id: '008', name: 'Page 8'),
  // FacebookPage(id: '009', name: 'Page 9'),
  // FacebookPage(id: '010', name: 'Page 10'),
  // FacebookPage(id: '011', name: 'Page 11'),
  // FacebookPage(id: '012', name: 'Page 12'),
  // FacebookPage(id: '013', name: 'Page 13'),
  // FacebookPage(id: '014', name: 'Page 14'),
  // FacebookPage(id: '015', name: 'Page 15'),
  // FacebookPage(id: '016', name: 'Page 16')
];

List<Product> _products = [
  Product(id: '001', name: 'Product 1', price: 50),
  Product(id: '002', name: 'Product 2', price: 60)
];

List<Delivery> _deliveries = [
  Delivery(
      id: '001',
      name: 'Delivery 1',
      deliveryPrice: 2,
      phonenumber: '012112233'),
  Delivery(
      id: '002',
      name: 'Delivery 2',
      deliveryPrice: 2.5,
      phonenumber: '011345666')
];

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SaleScreenState();
  }
}

class _SaleScreenState extends State<SaleScreen> {
  String? _facebookPageValue;
  String? _tmpSelectedProduct;
  String? _deliveryValue;
  dynamic tmpDelivery;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: const Text("Sale"),
              bottom: const TabBar(tabs: tabs),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        children: [
                          InputContainer(
                            label: "Facebook Name",
                            input: TextFormField(),
                          ),
                          InputContainer(
                            label: "Facebook Page",
                            input: DropdownButton(
                              value: _facebookPageValue,
                              onChanged: (String? val) {
                                setState(() {
                                  _facebookPageValue = val!;
                                });
                              },
                              items: _facebookPages
                                  .map((FacebookPage e) => DropdownMenuItem(
                                      child: Text(e.name), value: e.id))
                                  .toList(),
                              isExpanded: true,
                            ),
                          ),
                          InputContainer(
                            label: "Facebook Link",
                            input: TextFormField(),
                          ),
                          InputContainer(
                            label: "Mobile Phone",
                            input: TextFormField(),
                          ),
                          InputContainer(
                            label: "Other Phone",
                            input: TextFormField(),
                          ),
                          InputContainer(
                            label: "Address",
                            input: TextFormField(maxLines: 2),
                          ),
                          InputContainer(
                            label: "Select Delivery",
                            input: DropdownButton(
                              value: _deliveryValue,
                              items: _deliveries
                                  .map((Delivery e) => DropdownMenuItem(
                                        child: Text(e.name),
                                        value: e.id,
                                      ))
                                  .toList(),
                              isExpanded: true,
                              onChanged: (String? val) {
                                setState(() {
                                  _deliveryValue = val!;
                                });
                                tmpDelivery = _deliveries.where(
                                    (element) => element.id == _deliveryValue);
                                print(tmpDelivery);
                              },
                            ),
                          ),
                          InputContainer(
                            label: "Delivery Price",
                            input: TextFormField(
                              initialValue: "a",
                              readOnly: true,
                            ),
                          ),
                          InputContainer(
                            label: "Delivery Mobile Phone",
                            input: TextFormField(),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputContainer(
                            label: "Product",
                            input: DropdownButton(
                              value: _tmpSelectedProduct,
                              items: _products
                                  .map((Product e) => DropdownMenuItem(
                                      child: Text(e.name), value: e.id))
                                  .toList(),
                              onChanged: (String? val) {
                                setState(() {
                                  _tmpSelectedProduct = val!;
                                });
                              },
                              isExpanded: true,
                            ),
                          ),
                          InputContainer(
                            label: "Unit",
                            input: TextFormField(),
                          ),
                          InputContainer(
                            label: "Unit Price",
                            input: TextFormField(),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Add Product'),
                            ),
                          ),
                          InputContainer(
                            label: "Total Price",
                            input: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
