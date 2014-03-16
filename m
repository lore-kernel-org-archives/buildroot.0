From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 16:25:19 +0100
Subject: [Buildroot] [PATCH 0/3] Misc RPi-related bumps (branch yem/bumps)
Message-ID: <cover.1394983430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series with Raspberry Pi related bumps:
  - rpi-firmware: misc fixes and enhancements
  - rpi-userland: misc enhancements
  - raspberypi_defconfig: bump kernel

Regards,
Yann E. MORIN.


The following changes since commit 9b4696a49f35d64dfae5bcdc11a5a6fb2d0a76cf:

  rsyslog: bump to version 7.6.0 (2014-03-15 23:53:02 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 5e7e25d2a1638a19595137e49dd92ea43cfb2b43:

  configs/raspberrypi: bump kernel version (2014-03-16 15:00:15 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-firmware: bump version
      package/rpi-userland: bump version
      configs/raspberrypi: bump kernel version

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
