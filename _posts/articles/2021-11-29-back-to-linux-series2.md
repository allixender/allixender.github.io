---
layout: article
title: Back to Linux Series 2
modified: 2021-11-29
categories: articles
tags: [btl, ramblings]
share: true
image:
  teaser: eos_basic_arandr1.jpg
---

{% include toc.html %}

## Later that day

So, actually, it wasn't perfect of course. It was working, but on the docking station with two additional monitors, the task bar/panel and the main screen areas didn't scale correctly. That's a typical problem.

With `arandr` one can quickly configure the screen positions and the primary screen, and then store it as a screen layout, which is a Bash script, that calls `xrandr` with all the parameters. As long as the desktop now keeps the configuration settings, e.g. on which screen which wallpaper. The panel can be configured to be active only on the primary screen.

I also had that with Qtile. Although, Qtile chooses to distribute non active workspaces over the vacant screens in the order in which you switched to and from them. That is a nice behaviour, especially if you usually don't have the necessity to span a single window over multiple screens. Something to consider for later. maybe it is possible in XFCE, too.

Now I have a basic multi-screen layout, which looks like that.

![but_then_it_was_like](/images/eos_basic_arandr1.jpg)
