Polymer core and paper elements examples
========================================

This repo contains examples for the core and paper polymer elements.

## Running examples

The core examples are available  [here](http://dart-lang.github.io/polymer-core-and-paper-examples/build/web/core_demos.html) and the paper examples are available [here](http://dart-lang.github.io/polymer-core-and-paper-examples/build/web/paper_demos.html).

## Building examples

If you download or fork the repo from
https://github.com/dart-lang/polymer-core-and-paper-examples,
then you can use the `pub` command to run demos.

If you only want to run a few examples, then you can edit `pubspec.yaml` and add
them to the `entry_points` list. This will greatly reduce your build times.

To run a demo:

1. From the top directory, use the `pub serve` command.

2. In a browser, visit <code>http://localhost:8080/<em>element_name</em>.html).

   Note that you use an underscore (`_`) instead of the dash (`-`)
   in the element name.
   For example, to see the core-icons demo, browse to
   <a href="http://localhost:8080/core_icons.html">http://localhost:8080/core_icons.html</a>.

   For a full list of demos, you can just visit the index.html.


To create a deployable build of one or more demos:

1. From the top directory, use the `pub build` command:

    pub build

2. Copy the files from the resulting `build` directory to
   where you want to serve the files.

**Note:** Building the demos might take a few minutes.
 
