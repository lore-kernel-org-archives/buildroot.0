From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 23:24:50 +0200
Subject: [Buildroot] [PATCH 0/3] Raspberry Pi related bumps (branch
	yem/bumps)
Message-ID: <cover.1397424240.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are bumps to the Raspberry Pi packages and defconfig.

Regards,
Yann E. MORIN.


The following changes since commit fae7cc33a117d5408019b705d76ebb4549593f88:

  mtd: fix build against uClibc (2014-04-13 21:44:06 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 973098d2a86e14ab0e39d8388f7ca7b8744c2c96:

  configs: bump raspberrypi_defconfig to use the latest stable kernel (2014-04-13 23:21:50 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-userland: bump revision
      package/rpi-firmware: bump revision
      configs: bump raspberrypi_defconfig to use the latest stable kernel

 configs/raspberrypi_defconfig        | 4 ++--
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
