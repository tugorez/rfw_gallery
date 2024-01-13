import 'package:rfw/rfw.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;

const LibraryName mainLibraryName = LibraryName(<String>['main']);

Runtime createRuntime(String library) => Runtime()
  ..update(_coreLibraryName, createCoreWidgets())
  ..update(_materialLibraryName, createMaterialWidgets())
  ..update(mainLibraryName, parseLibraryFile(library));

const LibraryName _coreLibraryName = LibraryName(<String>['core', 'widgets']);
const LibraryName _materialLibraryName = LibraryName(<String>['material']);
