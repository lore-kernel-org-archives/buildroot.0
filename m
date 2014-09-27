From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 11:45:29 +0200
Subject: [Buildroot] [PATCH 0/3] raspberry pi: bump versions (branch
	yem/rpi-bump)
Message-ID: <cover.1411811051.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series updates all RPi-related components:
  - firmware
  - userland
  - kernel + toolchain headers

Unlike I usually do, there is no detailed changlog for the firmware and
userland packages, because there are so much that changed.

Regards,
Yann E. MORIN.


The following changes since commit 6f5bffc426f7418c555291450d482a0ceede0865:

  qemu-ppc: update kernel to latest for g3beige emulation (2014-09-27 09:53:12 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/rpi-bump

for you to fetch changes up to 05ec333147c20910185c55dabe30136b54e180af:

  configs: update raspberrypi_defconfig (2014-09-27 11:41:21 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-firmware: bump revision for a lot of fixes + enhancements
      package/rpi-userland: bump revision for fixes + enhancements
      configs: update raspberrypi_defconfig

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
