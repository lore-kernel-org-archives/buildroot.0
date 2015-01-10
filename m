From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jan 2015 14:14:54 +0100
Subject: [Buildroot] [PATCH 0/2 v3] RPi: enable building a
	device-tree-enabled kernel (branch yem/rpi-dt)
Message-ID: <cover.1420895562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series completes support for a Device-Tree-enabled Raspberry Pi:
  - introduce a new defconfig file,
  - update the board documentation.


Changes v2 -> v3:
  - bundle our own Linux defconfig  (Thomas)
  - build our own toolchain  (Thomas)
  - drop patches already applied  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 0ae1ab3ed51ff2368767b4d8b163a5da7011a8b4:

  openntpd: bump to version 5.7p1 (2015-01-10 13:17:38 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi-dt

for you to fetch changes up to 8a8fae5cc4323365edbf7c8e7ceb98e76ac547ef:

  boards/raspberrypi: update readme with Device Tree instructions (2015-01-10 13:48:31 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      configs: add a DT-enabled Raspberry Pi defconfig
      boards/raspberrypi: update readme with Device Tree instructions

 board/raspberrypi/linux-3.18-rpi-dt.defconfig | 204 ++++++++++++++++++++++++++
 board/raspberrypi/readme.txt                  |  31 +++-
 configs/raspberrypi_dt_defconfig              |  12 ++
 3 files changed, 243 insertions(+), 4 deletions(-)
 create mode 100644 board/raspberrypi/linux-3.18-rpi-dt.defconfig
 create mode 100644 configs/raspberrypi_dt_defconfig

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
