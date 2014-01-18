From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:15 +0100
Subject: [Buildroot] [PATCH 0/5] Misc bumps
Message-ID: <cover.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few bunps:
  - packages and defconfig for Raspberry Pi
  - linux-firmware, plus install two new firmware files

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (5):
      package/rpi-firmware: bump for misc fixes/improvements
      package/rpi-userland: bumps for misc fixes and improvements
      configs/raspberrypi: bump kernel version
      package/linux-firmware: bump
      package/linux-firmware: add iwlwifi 3160 and 7260 firmware files

 configs/raspberrypi_defconfig            |  2 +-
 package/linux-firmware/Config.in         | 12 ++++++++++++
 package/linux-firmware/linux-firmware.mk | 12 +++++++++++-
 package/rpi-firmware/rpi-firmware.mk     |  2 +-
 package/rpi-userland/rpi-userland.mk     |  2 +-
 5 files changed, 26 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
