import 'package:injectable/injectable.dart';
import 'package:tour_of_heroes/mock-heroes.dart';
import './model/hero.dart' as Toh;

@injectable
class HeroService {
  Future<List<Toh.Hero>> getHeroes() {
    return Future.value(HEROES);
  }
}