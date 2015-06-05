---
layout: article
title: Setting up your IDE for development with GeoTrellis
modified: 2015-06-05
categories: articles
excerpt:
tags: [gsoc]
share: true
image:
  teaser: main-teaser-450.png
---

{:toc}

## Eclipse ScalaIDE

* make sure you have the ScalaIDE plugins installed or use ScalaIDE dedicated built
* checkout/clone GeoTrellis git repo
* add sbt-eclipse plugin
* run ./sbt eclipse
* import prject from existing sources / existing project from filesystem
* fix missing cross project references and imports

## IntelliJ IDEA

* you could try using sbt-idea sbt plugin and run ./sbt gen-idea, but newer version of IDEA IDE support native import
* checkout/clone GeoTrellis
* in IDEA new project -> import from native model (SBT)
* wait ...
* add scala sdk (will be offered)
* add VCS root (will be offered)
* done
* better :-)

## Other "IDEs"

* use VIM, Emacs or your favourite editor, ideally with syntax highlighting at least
* try Ensime
* use ag - The Silver Searcher



