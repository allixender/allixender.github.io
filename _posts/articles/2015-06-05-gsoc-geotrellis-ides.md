---
layout: article
title: Setting up your IDE for development with GeoTrellis (or any other complex Scala project)
modified: 2015-06-05
categories: articles
tags: [gsoc]
share: true
image:
  teaser: geotrellis-teaser-450.png
---

{% include toc.html %}

TL;DR: Beginners, use IDEA. Beyond that your mileage may vary.

## IntelliJ IDEA

With IDEA it looked more promising, however, I am still a novice with IDEA and Scala setup. 
The IntelliJ IDEA scala plugin (in IDEA, not the sbt-idea plugin) has support to import native sbt projects. 

* checkout/clone GeoTrellis
* in IDEA new project -> import from native model (SBT)

![idea-import1](http://allixender.github.io/images/idea-import1.png)

* select JDK to be assigned

![idea-import2](http://allixender.github.io/images/idea-import2.png)

* wait ...

![idea-import3](http://allixender.github.io/images/idea-import3.png)

* add VCS root (will be offered), just confirm `Add root`, because you are working in the proper git directory

![idea-import4](http://allixender.github.io/images/idea-import4.png)

* add scala sdk (will be offered), just select and confirm `scala 2.10.4` when it pops up
* done ... there might pop up warnings about multiple versions: This is an artifact of the multiple transitive 
dependencies, and has not shown to be problematic
* also thanks for the [link from Chuck](https://groups.google.com/forum/#!topic/geotrellis-user/4R_QSEUZZ9A) 
(posted 11th of Feb 2015 in the [GeoTrellis Google Group](https://groups.google.com/forum/#!forum/geotrellis-user)

## Eclipse ScalaIDE (via sbt plugins)

A try with Eclipse and IDEA with geotrellis and sbt plugins, to set up IDE friendly project configuration:

* make sure you have the ScalaIDE plugins installed or use ScalaIDE dedicated built
* checkout/clone GeoTrellis git repo
* add `sbt-eclipse` plugin

In `project/plugins.sbt` add:

~~~ scala
addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "3.0.0")

// for IDEA alternatively, however, this is discouraged for IDEA as of the latest versions
// fir IDEA run ./sbt gen-idea, but newer version of IDEA IDE support native import
// IDEA would recognise the `sbt-idea` project and actually advised to import via native model in IDEA.
// addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")
~~~

* run `./sbt eclipse` or ideally (if you have even more time `./sbt "eclipse with-source=true"` )
* in Eclipse import project from existing sources / existing project from filesystem

Eclipse unfortunately would not pick up all "inter-project" dependencies, like in geotrellis-spark it 
wouldn't pull in geotrellis-raster and geotrellis-proj4.

I tried fiddling around with the `Build.scala` etc to adjust the dependencies between the sub-projects/geotrellis 
modules, but without luck.

So you have to fix the missing cross project references and imports:

With additional linked source folders configured on the build build path in Eclipse it is 
possible to add the missing dependencies. So sbteclipse-plugin was added to `project/plugins.sbt` 
and then just execute `./sbt eclipse`

This results in a eclipse project configuration for **each** geotrellis subproject/module, 
It'll also try to be all Scala 2.11 and show some errors that Scala versions are also of 2.10, 
this doesn't affect the programming or type resolution, only causes red lines and exclamation 
marks in the IDE representation.

![eclipse1](https://cloud.githubusercontent.com/assets/4483885/7805408/583b9090-0361-11e5-8d6a-1d95ad1d3d6c.png)

In Eclipse right click on the project in the left outline, choose `configure build path`. 
Just adding the related projects won't work (add them like this, but it's not enough)

![eclipse2-buildpath1](https://cloud.githubusercontent.com/assets/4483885/7805433/c4796408-0361-11e5-9d56-cc6d7024146d.png)

For manageability I added linked folders via variables (e.g. `GEO_VECTOR: $WORKSPACE/geotrellis-vector`), 
and then used the  variables to actually link in the `$GEO_VECTOR/src/main/scala` folder into 
the geotrellis-spark project. Then those dependencies would resolve. Eclipse also sees implicit 
context items e.g. implicit conversions.

![eclipse2-buildpath2](https://cloud.githubusercontent.com/assets/4483885/7805496/061fc680-0363-11e5-8836-c0906ba41412.png)

## Other "IDEs"

* use VIM, Emacs or your favourite editor, ideally with syntax highlighting at least
* try [Ensime](http://ensime.github.io/)
* in the shell, enter sbt console and keep `~compile` going
* in parallel use [ag - The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
* for emacs you might also want to look at [Projectile](https://github.com/bbatsov/projectile)
* for VIM and Scala there has recently been an [interesting article](https://advancedweb.hu/2015/06/11/vim-scala/)

## A few notes on git for beginners

* fork geotrellis repo into github via github first
* then check out your fork from your github
* add the upstream "root" geotrellis master repo
* get your local master up to date
* branch your local dev brach

~~~ bash
git clone git@github.com:/allixender/geotrellis
cd geotrellis
git remote add upstream https://github.com/geotrellis/geotrellis.git
git fetch upstream
git merge upstream/master
git checkout -b feature/my-feature-dev
~~~

* then you commit to your local branch
* then you push your local branch into your github origin
* from your github fork you could then issue pull requests to the geotrellis/geotrellis upstream master