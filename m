From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 16:33:18 +0100
Subject: [Buildroot] [PATCH 0/3 v6] package/gobject-introspection: misc
 fixes (branch yem/goi-fixes)
Message-ID: <cover.1584286382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Series based on previous work by Adam, with commit logs slightly
expanded and reworded with my own understanding of the problems
and the fixes.


Regards,
Yann E. MORIN.


The following changes since commit 17a75bbccfd9a4e7810cbb2fe4182b4f9276cc45

  package/perl-timedate: bump to version 2.32 (2020-03-15 16:11:09 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 2b3494c60f3e0d1a9bdf79dfb902e685b713c0e3

  package/meson: determine g-ir-scanner and g-ir-compiler paths from pkgconfig (2020-03-15 16:32:31 +0100)


----------------------------------------------------------------
Adam Duskett (3):
      package/gobject-introspection: fix host-linking
      package/gobject-introspection: export variables in g-ir-scanner
      package/meson: determine g-ir-scanner and g-ir-compiler paths from pkgconfig

 package/gobject-introspection/g-ir-scanner.in      | 14 +++++
 .../gobject-introspection/gobject-introspection.mk | 20 +++++--
 ...rospection-determine-g-ir-scanner-and-g-i.patch | 62 ++++++++++++++++++++++
 ...modules-gnome.py-Fix-giscanner-and-gicomp.patch | 41 ++++++++++++++
 4 files changed, 132 insertions(+), 5 deletions(-)
 create mode 100644 package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 create mode 100644 package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
