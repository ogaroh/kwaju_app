import 'package:assessment/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(ShoppingCubit().state, equals(0));
    });

    blocTest<ShoppingCubit, int>(
      'emits [1] when increment is called',
      build: ShoppingCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<ShoppingCubit, int>(
      'emits [-1] when decrement is called',
      build: ShoppingCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
