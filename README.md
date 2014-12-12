Polymer core and paper elements examples
========================================

This repo contains examples for the core and paper polymer elements.

## Running demos

If you download or fork the repo from
https://github.com/dart-lang/polymer-core-and-paper-examples,
then you can use the `pub` command to run demos.

If you only want to run a few demos, then you can edit `pubspec.yaml` to
comment out (using `#`) all the entrypoints except the ones you need.

To run a demo:

1. From the top directory, use the `pub serve` command, specifying the
   `example` directory:

        pub serve

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
 
## Updating demos

These demos are all ports of corresponding javascript demos. To upgrade to a new
version, follow these steps:

1. Update the `bower.json` file dependencies to the new version.

2. Run `bower update`, this will pull in the new versions to the `js_src` dir.
   These files are only used as a reference for diffing between versions.

3. Run `dart tool/cleanup.dart` to remove all but the `demo.html` files.

4. Look at the diff, and port those changes.
