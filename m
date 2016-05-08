From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 May 2016 15:49:58 +0200
Subject: [Buildroot] [PATCH 0/2] boards: add rpi-zero defconfig (branch
	yem/rpi-zero)
Message-ID: <cover.1462715338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series adds support for the Raspberry Pi Zero.

The first patch bumps rpi-firmware, to get new DT overlays specific to
the zero.

The second patch actually adds a defconfig for the rpi0.

Regards,
Yann E. MORIN.


The following changes since commit b2dcb2d6c4144688e2b9ec4d744af306276120f1

  fs/common: fix typo in comments (2016-05-08 15:34:52 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to 6566e90641147f226d7432b25723574dd92d5b69

  boards/raspberrypi0: new board (2016-05-08 15:43:18 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-firmware: bump version for rpi0
      boards/raspberrypi0: new board

 board/raspberrypi/genimage-raspberrypi0.cfg | 30 +++++++++++++++++++++++++
 board/raspberrypi0                          |  1 +
 configs/raspberrypi0_defconfig              | 34 +++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk        |  2 +-
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 create mode 120000 board/raspberrypi0
 create mode 100644 configs/raspberrypi0_defconfig

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
