import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bilgi_duellosu/oyun_bilgi_duellosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bilgiDuellosuConfig.title.length, 33);
    expect(bilgiDuellosuConfig.tagline.length, 33);
    for (final s in bilgiDuellosuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(bilgiDuellosuConfig.gameId, bilgiDuellosuId);
    expect(bilgiDuellosuRules.gameId, bilgiDuellosuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bilgiDuellosuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bilgiDuellosuId, optionalMechanics: bilgiDuellosuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bilgiDuellosuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
