---
layout: article
title: Back to Linux Series - Estonia, Open EID SMART cards and Arch Linux
modified: 2022-01-20
categories: articles
tags: [btl, ramblings]
share: true
image:
  teaser: est_openeid_digidoc.png
---

{% include toc.html %}

## Still on Linux

Just earlier this week, my colleagues, who runs his laptop devotedly with Ubuntu and a Cinnamon desktop, was surprised to hear that I am running Linux on my work computer.
He is a JavaScript/Node developer mostly and if at all, interacts with our University systems via MS Teams if needed. Everything else is Github, LibreOffice, and VSCode.
So it was quite funny when I mentioned that I am "still" on Linux, he even wanted to celebrate :-) Everyone in the department just works with the run-of-the-mill Windows,
except a few extravagant senior staff who use MacBooks for research (I guess mostly writing anyway).

So, it has become more natural to rethink all the typical workflows in Linux. I am still a bit uneasy about joint journal article writing of less technical staff with MS Word.
We have several articles done in Overleaf/Latex, but less technical (or less flexible) staff and supervisors do like to have a single WYSIWYG MS Word document. In addition,
shared references editing via tools like Zotero and Mendeley would require the same local setup. Luckily no one here is anymore allowed to buy licenses for EndNote.
But while those reference manager plugins exist for Word and LibreOffice, You can't (shouldn't?) mix these during editing sessions. So this is still a bit uncomfortable.
And I am not going to "force" my peers and seniors to use LibreOffice, just because I can't run the same Ms Word setup. I can do MS Word editing via MS Teams, Sharepoint, OneDrive,
but then I don't touch the references.

## Estonian Digital Society

Another thing I have now encountered is the need for using my Estonian ID card to digitally sign contracts and other formal documents.
Furthermore, many online service provide login via the ID card including banks and the health portal (think COVID pass).

The software ecosystem around Estonia' digital cryptographically secured services is quite supportive. The state department for IT provides prebuilt packages for 
Windows, MacOS and Ubuntu Linux, including the sources. For Arch Linux there are AUR packages available and if need be you can compile all that stuff yourself.

![est_openeid_digidoc.png](/images/est_openeid_digidoc.png)

- https://www.id.ee/en/article/operating-systems-supported-by-id-software/
- https://www.id.ee/en/article/install-id-software/
- https://github.com/open-eid
- https://wiki.archlinux.org/title/Electronic_identification#Estonia
- https://wiki.archlinux.org/title/Smartcards

You need to make sure you have a couple more packages, like 'boost', 'xml-security-c', 'xalan-c', 'libdigidocpp', 'opensc', 'ccid', 'pcsc-tools', some from AUR some directly via 'pacman'.

Then make sure to enable and start the 'pcscd' service, you can test you card recognition via the 'pcsc-scan' tool.

Finally, install 'qdigidoc4' from AUR.

Also, there seems to be a conflict with 'podofo', so maybe if you don't need it, don't install it.

To enable PIN 1 authentication in Firefox you should install 'esteidpkcs11loader' and 'chrome-token-signing'


## Python and scientific computing

Arch Linux moved to Python 3.10 release, which broke a couple of configurations, especially in relation installed wheels and compiled packages that provide a Python API.
This caused some work, recompiling and reinstalling in order to continue relying on the system Python.

However, I have also looked into [PyEnv](https://github.com/pyenv/pyenv). Now, Arch Linux is already a specific and very dynamic distribution, but then EndevourOS adds additional customisation on top. So in my first tries 
of making [PyEnv](https://archlinux.org/packages/community/any/pyenv/) work for me the shell initialization didn't seem to behave as expected. But I believe I found a way. It is mostly about the order of '.bashrc', '.bash_profile', '.profile' sourcing. Arch and EndevourOS 
don't even have a '.profile'.

```bash
# in .bashrc

# https://github.com/pyenv/pyenv
eval "$(pyenv init -)"

# --------
# in .bash_profile

# https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

```


