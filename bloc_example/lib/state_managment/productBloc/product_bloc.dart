import 'package:bloc_example/state_managment/productBloc/product_event.dart';
import 'package:bloc_example/state_managment/productBloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(list: []));

  mapEventToState(ProductEvent event, Product product) {
    switch (event) {
      case ProductEvent.insert:
        state.list.add(product);
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ProductState(list: state.list));

        break;
      case ProductEvent.delete:
        List<Product> newList = [];
        for (int i = 0; i < state.list.length; i++) {
          if (state.list[i].name != product.name) {
            newList.add(
                Product(fiyat: state.list[i].fiyat, name: state.list[i].name));
          }
        }
        state.list = newList;
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ProductState(list: state.list));

        break;
    }
  }
}
