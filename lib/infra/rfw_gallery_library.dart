import 'package:rfw/rfw.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw_gallery/infra/rfw_gallery_library/themed_text.dart';
import 'package:rfw_gallery/infra/rfw_gallery_library/expansion_tile.dart';

const LibraryName rfwGalleryRfwLibraryName = LibraryName(<String>[
  'rfw_gallery',
  'rfw',
]);
final WidgetLibrary rfwGalleryRfwLibrary = parseLibraryFile(
  '''
  import core.widgets; 
  import material;
  import rfw_gallery.local;

  widget RfwGalleryScreen = Scaffold(
    appBar: RfwGalleryAppBar(title: args.title),
    body: Padding(
      padding: [40, 20],
      child: args.child,
    ),
  );

  widget RfwGalleryAppBar = AppBar(
    title: Text(text: args.title),
  );
  ''',
);

const LibraryName rfwGalleryLocalLibraryName = LibraryName(<String>[
  'rfw_gallery',
  'local',
]);

final LocalWidgetLibrary rfwGalleryLocalLibrary = LocalWidgetLibrary(
  <String, LocalWidgetBuilder>{
    'ThemedText': themedText,
    'ExpansionTile': expansionTile,
  },
);
