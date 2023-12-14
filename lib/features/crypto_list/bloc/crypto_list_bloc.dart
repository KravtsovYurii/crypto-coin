import 'dart:async';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final InterfaceCoinsRepository coinsRepository;

  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>(_load);
  }
  Future<void> _load(
    LoadCryptoList event,
    Emitter<CryptoListState> emit,
  ) async {
    try {
      if (state is! CryptoListLoaded) {
        emit(CryptoListLoading());
      }

      final coinsList = await coinsRepository.getCoinsList();

      emit(CryptoListLoaded(coinsList: coinsList));
    } catch (e) {
      emit(CryptoListLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
