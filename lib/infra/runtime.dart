import 'package:rfw/rfw.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw_gallery/infra/rfw_gallery_library.dart';

const LibraryName mainLibraryName = LibraryName(<String>['main']);

Runtime createRuntime(String library) => Runtime()
  ..update(const LibraryName(<String>['core', 'widgets']), createCoreWidgets())
  ..update(const LibraryName(<String>['material']), createMaterialWidgets())
  ..update(rfwGalleryLocalLibraryName, rfwGalleryLocalLibrary)
  ..update(rfwGalleryRfwLibraryName, rfwGalleryRfwLibrary)
  ..update(mainLibraryName, parseLibraryFile(library));
