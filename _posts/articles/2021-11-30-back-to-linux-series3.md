---
layout: article
title: Back to Linux Series 3
modified: 2021-11-30
categories: articles
tags: [btl, ramblings]
share: true
image:
  teaser: timeshift_snapshot_2021-11-30.png
---

{% include toc.html %}

## Actual work

My daily work consists of writing, geospatial data wrangling and modelling, and more varieties of writing or otherwise communicating.
Sometimes I like to fiddle with other tech stuff, such as web maps, SDI web services, API development.

I need more apps:

- MS Teams
- QGIS Desktop
- Inkscape and Drawing
- LibreOffice

Also, we have a network printing system, and of course Windows shares.

- Samba and smbmount, done, but it seems Thunar by default only seems to mount my local Windows partition in read-only mode.
- [CUPS printing system](https://discovery.endeavouros.com/printers/printers/2021/03/)

Emails:

So far I have used Thunderbird exclusively on Windows and Linux. I have accumulated ca 15 GB of maildirs in my Windows account user home. While I am very used to Thunderbird, some things I haven't quite figured out in my everyday work.
Some people do the `Inbox Zero` thing, others use the inbox synonymously as `All My Mail (tm)`. I have a few extra folders to keep some mails of out my main inbox, but mostly I use the *unread* marker together with sorting by date (desc) and *unread* as my main means of keeping track of what I have to catch up with. Also, I have at least 3 comparatively active account, Yahoo, Gmail and my MS Office365 work account.

However, searching older mails is sometimes not as practical in Thunderbird. In most cases I get away with the quickfilter in the main inbox folders, but that requires some metadata memory of what I am looking for. Older things, like 1-2 years old, I barely can remember exact email addresses or especially subject lines related to the topic of interest.

So, as I am a fan of `command-line-fu`(it's a thing, cf: [commandlinefu.com](https://www.commandlinefu.com/)), I am playing with the thought of entering the world of shell-based email handling. In particular the following combo seems a popular choice.

- Neomutt - Email client
- NeoVim - Email editor
- Notmuch - Email indexer (for searching)

- https://uttarayan.me/posts/setting-up-neomutt/
- https://jonathanh.co.uk/blog/mutt-setup/
- https://github.com/LukeSmithxyz/mutt-wizard

## Nerd stuff

I got a bit carried away and installed more fonts and symbols and I am going to try:

- [Starship](https://starship.rs/): the cross-shell prompt for astronauts
- [Fish](https://fishshell.com/): the friendly interactive shell

Probably both a waste of time for now, but hey, it might be nice.

Also, I love vim, I'll give `nvim` a short over the next time. I guess, it won't be much of a difference, since I don't do much magic with `vim` plugins ... yet :-) Here are some links to try, I am really keen on checking that out myself:

- [NeoVim and must-have plugins](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/)
- [VimPlug, popular vim plugins manager](https://github.com/junegunn/vim-plug)
- [NeoVim as Python IDE](https://ramezanpour.net/post/2021/04/24/My-ultimate-Neovim-configuration-for-Python-development)
- [Pynvim, a Neovim Python API thing](https://pynvim.readthedocs.io/en/latest/usage/python-plugin-api.html)
- [NeoVim Rust](https://sharksforarms.dev/posts/neovim-rust/)
- [Rust tooling for nvim](https://github.com/simrat39/rust-tools.nvim)

## Also, backup

Admittedly, I haven't done actual backups of my file systems regularly, as most of my work stuff is either in GitHub, Google Cloud Buckets, Nextcloud or shared network drives. And privately I use Google Drive/Google One and NextCloud as well.

So, I thought ahead and configured my Linux system with BTRFS and hope to test Timeshift!

![joplin](/images/timeshift_snapshot_2021-11-30.png)

We'll see how that goes.
