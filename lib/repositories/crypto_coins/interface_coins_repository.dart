import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';

abstract interface class InterfaceCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
