import 'package:bloc_example/state_managment/productBloc/product_bloc.dart';
import 'package:bloc_example/state_managment/productBloc/product_event.dart';
import 'package:bloc_example/state_managment/productBloc/product_state.dart';
import 'package:bloc_example/views/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ProductPageViewModel on State<ProductPage> {
  TextEditingController fiyat = TextEditingController();
  TextEditingController name = TextEditingController();
  ValueNotifier get isvalid =>
      ValueNotifier<bool>(fiyat.text.isNotEmpty && fiyat.text.isNotEmpty);

  void insertListItem(Product item) {
    if (isvalid.value) {
      context.read<ProductBloc>().mapEventToState(ProductEvent.insert, item);
    }
  }

  void deleteListItem(Product item) {
    if (isvalid.value) {
      context.read<ProductBloc>().mapEventToState(ProductEvent.delete, item);
    }
  }
}
