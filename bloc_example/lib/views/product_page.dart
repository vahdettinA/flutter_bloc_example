import 'package:bloc_example/state_managment/productBloc/product_bloc.dart';
import 'package:bloc_example/state_managment/productBloc/product_state.dart';
import 'package:bloc_example/viewmodel/product_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with ProductPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertListItem(
              Product(fiyat: int.parse(fiyat.text), name: name.text));
        },
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: fiyat,
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteListItem(Product(
                              fiyat: state.list[index].fiyat,
                              name: state.list[index].name));
                        },
                      ),
                      title: Text(state.list[index].name),
                      subtitle: Text(state.list[index].fiyat.toString()),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
