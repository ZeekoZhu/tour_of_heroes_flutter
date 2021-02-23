import 'package:injectable/injectable.dart';
import 'package:tour_of_heroes/message.service.dart';
import 'package:tour_of_heroes/mock-heroes.dart';
import './model/hero.dart' as Toh;

@injectable
class HeroService {
  HeroService(this._messageService);

  MessagesService _messageService;

  Future<List<Toh.Hero>> getHeroes() {
    _messageService.add('HeroService: fetched heroes');
    return Future.value(HEROES);
  }

  Future<Toh.Hero> getHero(int id) {
    _messageService.add('HeroService: fetched hero $id');
    return Future.value(HEROES.firstWhere((h) => h.id == id));
  }
}
