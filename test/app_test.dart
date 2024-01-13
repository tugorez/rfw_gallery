import 'package:flutter_test/flutter_test.dart';
import 'package:rfw_gallery/app.dart';

void main() {
  testWidgets('Works!', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // The app bar.
    expect(find.text('RFW Gallery'), findsOneWidget);

    // Home screen content.
    expect(find.text('Hello world!'), findsOneWidget);
  });
}
