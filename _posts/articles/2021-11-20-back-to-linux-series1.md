---
layout: article
title: Back to Linux Series 1
modified: 2021-11-29
categories: articles
tags: [btl, ramblings]
share: true
image:
  teaser: eos_start_2021-11-29_09.png
---

{% include toc.html %}

## Taking stock

I have been a passionate Linux user since I started studying at the university during my BSc times in 2003 or 2004. I remember, Linux 2.4 kernel, self-compiled to get the DSL modem and the wifi drivers going. Exciting, but also annoying.

When I started to work as a network admin in 2005, I started with SuSE and SLES in the data center, and at home, I played with Gentoo and Linux from Scratch. Eventually, I settled on Arch Linux for all my desktop needs with KDE 3 and later KDE 4.

That went for several years until about 2010 when I started an MSc in Geoinformatics and required specific software that would only run on Windows. At that time, I didn't understand much about GIS and geospatial data. But that changed and it is an absolute exciting topic. Anyhow, I got myself a nice 14 inch Acer Aspire laptop with a licensed Windows OS version. But I quickly put on an Arch Linux again as a dual boot option. As my studies went on, I got really involved in GIS, Geoserver, geospatial web services based on OGC standards, and so on. This extended into my PhD, which I completed in New Zealand. Most technical posts on this blog [here (where you are reading right now)](https://allixender.github.io/) and [here](https://allixender.blogspot.com/2012/) in the time frame of 2012 to 2016 really are about my geospatial tech journey. Many JVM-based FOSS4G/FOSSGIS/OSGEO/LocationTech projects would be easy to work with on both operating systems.


In 2017 I started a PostDoc position at the University of Tartu in Estonia, and this year I made it to a proper faculty position as Research Fellow in Geoinformatics. I got a new work laptop, a hefty 14inch Lenovo Thinkpad T470p, 16 GB RAM, NVidia graphics, Core i7, the works (4 years ago, remember). Of course, it came with Windows 7 by then, and I used it as my main work OS. As I began teaching and research, I required somewhat compatible tooling that would primarily evolve around ArcGIS 10 (for ArcSWAT), SwatCup (a calibration toolkit for SWAT), and the MS Office suite for presentations and writing (shared work with colleagues), and MS Teams as a collaboration solution. For JVM and web-based JS developments, it wouldn't make much of a difference. And as for teaching, databases, SDI, and geospatial data processing and analysis with Python, I started to rely on anaconda/Miniconda3. Our computer labs are also Windows computers, so to prepare the lecture and practice materials for the students in a reliable, reproducible manner, it was prudent to experience working with `conda` on Windows myself.

I have also started to work heavily with QGIS since version 3.4 and 3.10, and barely run ArcMap, which I really only ever needed for certain scientific modeling exercises. In some research projects, I have started to use Google Cloud environments again and the University of Tartu HPC cluster, and I maintain a Linux for the department that sports a Postgresql database, some geoprocessing scripts, and a Geoserver for teaching purposes. And the more I interact with scripting workflows, web development, and scientific software development, the more I feel the need for a comfortable shell environment. I have used Cmder and WSL intensively, with conda environments, Jupyter lab, etc., but it still feels cumbersome. I have spent a lot of time getting software I needed to compile and run on Windows, such as [DGGRID7](https://www.discreteglobalgrids.org/software/) and [Google S2](https://s2geometry.io), and it is a little frustrating. That is sort of the back story to the point where I am now.

## Need for change

It is the end of 2021. We had COVID-19, and already at the change of the year from 2020 to 2021, I played with the thought of switching to Linux full-time as a New Year's resolution. I had already installed Linux again as a dual boot option on my work laptop. However, I mostly used that to try different Linux distributions desktop environments, but I never really worked on these. I tested how many of my usual workflows I could reproduce on Linux; I mean, everything is pretty much there, even the whole MS Office shebang, via MS Teams and Sharepoint in the browser, it is okay. I used Thunderbird exclusively and had either Google Calendar or Office 365 calendar open in the browser, even when on Windows. QGIS, databases (DBeaver), Atom (yeah, I sort of dropped VSCode), Python/conda with GDAL and Jupyter, Git, Google Cloud SDK, Hugo (no Jekyll on Windows), Mendeley reference database, all the same on Windows and Linux. I use Nextcloud and Google Drive a lot. I recently started to use Joplin as my primary notes and todo solution, which I sync with my phone. One important thing which I also got to work on Linux was OpenVPN access to the university network.

Of course, I had set up all my data and folders, and it creates quite the inertia to having to reestablish those structures. You stumble over the places where you haven't committed properly or where you did some renegade `python setup.py install` of some quickly edited software packages you found online to solve your current problem at hand. But that's only laziness, being in the comfort zone, the biggest resistance towards change, hahaha.

But I catch myself clicking and moving around with the mouse for a whole day, and I feel unproductive. Also, the mental overhead of having many windows open, many tabs in the browser, and then searching with the mouse, aimlessly clicking through the clutter. That might be exaggerated a bit, and it is almost a cheap excuse to bring forward the advantages of tiling window managers. Anyhow, I googled around what is possible nowadays, and I like to watch occasionally DistroTube and OldTechBloke on Youtube. So I got fond of Qtile, it is simple but gots the job done, it is Python. It was appealing.

## Actually trying to change

Deciding which distro to use for work and fun is a daunting task suddenly. I used vanilla Arch Linux for many years, but I knew I wouldn't have as much time anymore for installing and configuring a bare-metal distro. So I spent some time on ArchLabs Linux, but I never warmed up to OpenBox. For the kids, I had Manjaro Linux on an older laptop where they mostly watched Youtube and Netflix; I even installed some games and controllers. But it never caught on as a cheap gaming console. I also tested [Garuda Linux Qtile edition](https://garudalinux.org/downloads.html). Stunning, almost a little too much eye candy, but the color scheme was a bit off for me. I know I could have customized it. For some reason, I also considered testing various LUKS encrypted setups, but remember, I was still working mainly on Windows. And having /boot or Grub encrypted on a dual boot system caused more grieve than security. Having to enter the encryption password to start Windows was annoying, and my threat vector analysis is pretty low-key, and I would have to be more consistent anyway. So here you go again, comfort zone, not fully committed, you can also just leave it.

Anyhow, I am pretty decided on Arch Linux, or at least an Arch Linux flavor. In terms of desktop environments, or just window managers, I have experience in KDE/Plasma, XFCE, and Qtile.

 Last but not least, I came across [EndevourOS](https://endeavouros.com/): *"A terminal-centric distro with a vibrant and friendly community at its core."* Again, I was maybe trying to overcompensate or optimize and look for the perfect balance of desktop features, beauty, and Un*x simplicity. The default EndevourOS live system actually comes with XFCE, which I knew always isn't as amazing as a full-powered KDE/Plasma, or as practical and sleek as XMonad or AwesomeWM. I gave it a shot, and the installation and distro defaults are okay; the color scheme and wallpapers are charming. If I manage to write more posts, that means I am still on EndevourOS, and the Linux distro and WM/DE are actually getting out of the way, and I feel maybe simpler is better.
