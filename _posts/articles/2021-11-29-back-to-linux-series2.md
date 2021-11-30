---
layout: article
title: Back to Linux Series 2
modified: 2021-11-29
categories: articles
tags: [btl, ramblings]
share: true
image:
  teaser: eos_basic_arandr1_sm.png
---

{% include toc.html %}

## Later that day

So, actually, it wasn't perfect of course. It was working, but on the docking station with two additional monitors, the task bar/panel and the main screen areas didn't scale correctly. That's a typical problem.

With `arandr` one can quickly configure the screen positions and the primary screen, and then store it as a screen layout, which is a Bash script, that calls `xrandr` with all the parameters. As long as the desktop now keeps the configuration settings, e.g. on which screen which wallpaper. The panel can be configured to be active only on the primary screen.

I also had that with Qtile. Although, Qtile chooses to distribute non active workspaces over the vacant screens in the order in which you switched to and from them. That is a nice behaviour, especially if you usually don't have the necessity to span a single window over multiple screens. Something to consider for later. maybe it is possible in XFCE, too.

Now I have a basic multi-screen layout, which looks like that.

![but_then_it_was_like](/images/eos_basic_arandr1.jpg)


## Notes and todos

After spreading notes and todos over many different platforms, incl. but not limited to Trello, Google Docs and Google Todo and Google Keep, MS Office OneNote, PomoDone and even some full-on Sphinx docs, I realized, more notes/todo functionality is not needed, but I still need to keep my stuff together. I recently read a very revealing blogpost about some dudes who built a very successful todo and note taking app, and users loved it and wanted more features. The more features the developers implemented, the less the users actually got done. But they still kept on piling more todos.
Joplin also nicely syncs cross-platform via WebDAV and a few classic online storage providers. We have NextCloud from the university and it serves as an excellent cross-platform base for that as well. Joplin is only available in the AUR. EndevourOS Arch cames with `yay` as an AUR helper. I have used `yaourt` and `trizen` as well in the past. Personally, I don't have too much in-depth knowledge about difference and why some are discontinued. There are always some of those useful tools around.

```bash
[akmoch@lenovo-t470p install]$ yay -Ss joplin

aur/joplin-desktop-bin 2.5.12-1 (+0 0.00)
    An open source note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS
aur/joplin-beta 2.5.7-2 (+5 0.12) (Out-of-date: 2021-11-19)
    The latest pre-release - open source note taking and to-do application
aur/joplin-appimage 2.5.12-1 (+39 3.87)
    The latest stable AppImage of Joplin - a cross-platform note taking and to-do app
aur/joplin-desktop 2.4.12-1 (+203 4.63) (Out-of-date: 2021-10-31)
    A note taking and to-do application with synchronization capabilities - Desktop
aur/joplin 2.4.12-1 (+203 4.63) (Out-of-date: 2021-10-31)
    A note taking and to-do application with synchronization capabilities - CLI App
```

Curiously, Joplin had a lot of development activities lately. I used `chocolatey` on Windows to keep some of my everyday tooling up-to-date, incl. `FileZilla`, `DBeaver` and `Joplin`. There have been many releases during the last months.

```bash
$ yay -S aur/joplin-desktop-bin

# ... install ...

$ pacman -Ql joplin-desktop-bin

# the executable, desktop config, and icon locations:

joplin-desktop-bin /usr/bin/joplin-desktop
joplin-desktop-bin /usr/share/applications/@joplinapp-desktop.desktop
joplin-desktop-bin /usr/share/icons/hicolor/512x512/apps/@joplinapp-desktop.png
```

Then you can configure your synchronisation options. It creates also a startmenu entry under the "Office" section. However, you need to add the correct icon. If you have a big history, the first sync takes very long.

![joplin](/images/joplin_basic.png)

I use Joplin for keeping a short todo list, and then all additional information, drafts, and project descriptions, I use separate "notes".

## Talking of syncing - passwords

Matter of fact, I also use NextCloud of course for file syncing. Especially a nifty workflow which I am using is having my KeePassX password database available on all my devices, even on Android via `KeePassDroid`. I have migrated forward at least one or two version including the database upgrades, from the ".kdb" to the ".kdbx" format. There have been recently numerous even more interoperable version, incl. AIs to query passwords from the browser. That's maybe a bit too far ahead now. I still like to copy and paste manually from the database window. Anyhow, while on Windos and Android I havent't changed anything in a few years, on Linux KeePassX and KeePass2X rely on Qt4. That train is gone. So I guess, I will have to go with `KeePassXC`. Is is available in the Arch community repo (not AUR), so that means it is valuable enough.

```bash
sudo pacman -S nextcloud-client keepassxc
```

There is a whole suite of `Nextcloud` tools available for Arch, but for now I only need the desktop file syncing. The first time I started Nextcloud on the shell, configure to university server and the directories I'd like to sync. That went all well. It looks like there is even a tray icon while the app is active. I'll have to add Nextcloud to the autostart at some point.

When I started KeppAssXC, I was admittedly a bit overwhelmed. Too much features which I haven't used before. But it opens my default password database, so as long as other clients will still read and write the same database, I am okay.

So much setup stuff. But it works for now. Ask me in few days again.
