From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 23:35:55 +0100
Subject: [Buildroot] [PATCH 0/2] fix pinentry (branch yem/autobuild)
Message-ID: <cover.1418596437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

These two patches fix the pinentry package:
  - fix incorrect include paths in generated files;
  - fix build without Qt accessibility.

The first fix will (hopefully) close all our pinentry autobuild failures,
while the second is a preventive change backported from upstream.

Regards,
Yann E. MORIN.


The following changes since commit f31fed710212bc4b48fc920fed6f2f56afcdeec3:

  pckage/ncurses: fix pkg-config files for ncursesw (2014-12-14 23:28:40 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/autobuild

for you to fetch changes up to b1b44568a4bb46632d5c05cd28b84f3026575957:

  package/pinentry: allow building without Qt accessibility (2014-12-14 23:32:54 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/pinentry: fix include paths
      package/pinentry: allow building without Qt accessibility

 package/pinentry/0001-fix-include-paths.patch   |  42 ++++++++++
 package/pinentry/0002-qt-no-accessibility.patch | 102 ++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 package/pinentry/0001-fix-include-paths.patch
 create mode 100644 package/pinentry/0002-qt-no-accessibility.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
