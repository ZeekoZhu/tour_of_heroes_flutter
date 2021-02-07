import 'package:injectable/injectable.dart';
import 'package:tour_of_heroes/message.service.dart';
import 'package:tour_of_heroes/mock-heroes.dart';
import './model/hero.dart' as Toh;

@injectable
class HeroService {
  HeroService(this._messageService);

  MessageService _messageService;

  Future<List<Toh.Hero>> getHeroes() {
    _messageService.add('HeroService: fetched heroes');
    return Future.value(HEROES);
  }
}
