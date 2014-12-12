#!/usr/bin/env dart
// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

import 'dart:io';
import 'package:path/path.dart';

int filesDeleted = 0;
int foldersDeleted = 0;
int demoFilesFound = 0;
int demoFoldersFound = 0;

void main() {
  var dir = dirname(Platform.script.toFilePath(windows: Platform.isWindows));
  cleanDirectory(
      new Directory(normalize('$dir$separator..${separator}js_src')));
  print('''
Done!
Found $demoFilesFound `demo.html` files and $demoFoldersFound `demos` folders
Deleted $filesDeleted files and $foldersDeleted folders
''');
}

// Returns whether or not there was a demo file in the directory.
bool cleanDirectory(Directory dir) {
  var hasDemo = false;
  var fileEntities = dir.listSync(recursive: false, followLinks: false);
  for (var fileEntity in fileEntities) {
    if (fileEntity is File) {
      if (fileEntity.path.endsWith('demo.html')) {
        demoFilesFound++;
        hasDemo = true;
        continue;
      }
      fileEntity.deleteSync(recursive: false);
      filesDeleted++;
    } else if (fileEntity is Directory) {
      // Don't touch demos directories at all.
      if (fileEntity.path.endsWith('demos')) {
        demoFoldersFound++;
        hasDemo = true;
        continue;
      }
      hasDemo = cleanDirectory(fileEntity) || hasDemo;
    }
  };

  if (!hasDemo) {
    dir.deleteSync(recursive: false);
    foldersDeleted++;
  }
  return hasDemo;
}
