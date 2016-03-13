From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 23:25:47 +0100
Subject: [Buildroot] [PATCH 0/2] rpi: bump packages (branch yem/bumps)
Message-ID: <cover.1457907876.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series bumps the two RPi related packages. The DTB for the
RPi3 is now installed as well (although untested by lack of board).

Regards,
Yann E. MORIN.


The following changes since commit e6a29a4f3c48b13fde2214365067e34fbb92cfd6:

  gdb: specify where to find lzma libraries (2016-03-13 23:17:08 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/bumps

for you to fetch changes up to 8ddd3062cb5b95d9922760d6a86541ced163d627:

  package/rpi-userland: bump version (2016-03-13 23:22:30 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-firmware: bump version, add support for rpi-3
      package/rpi-userland: bump version

 package/rpi-firmware/rpi-firmware.mk               |  3 ++-
 ...ting-type-qualifiers-errors-when-building.patch | 23 ----------------------
 package/rpi-userland/rpi-userland.mk               |  2 +-
 3 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
