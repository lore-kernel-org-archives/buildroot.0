From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jan 2017 14:57:51 +0100
Subject: [Buildroot] [PATCH 0/2] package/weston: fix build
Message-ID: <cover.1485093464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the build under musl and disables the build of the
devloppers documentation.


Regards,
Yann E. MORIN.


The following changes since commit 961f13eedf461499c7fbb9c1c2bdff9f8b01d079

  util-linux: fix ncurses/wchar handling (again) (2017-01-22 17:53:24 +1100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ed8826b3fb08068e0473cd8f1037e683844d4373

  package/weston: fix build with musl (2017-01-22 14:56:12 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/weston: do not try to build dev docs
      package/weston: fix build with musl

 .../weston/0006-tests-add-missing-include.patch    | 36 ++++++++++++++++++++++
 package/weston/weston.mk                           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 package/weston/0006-tests-add-missing-include.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
