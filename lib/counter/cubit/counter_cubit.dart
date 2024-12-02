import 'package:bloc/bloc.dart';

class ShoppingCubit extends Cubit<int> {
  ShoppingCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
