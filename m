From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 May 2014 23:10:56 +0200
Subject: [Buildroot] [PATCH 0/3] RPi-related bumps (branch yem/bumps)
Message-ID: <cover.1399583377.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are the usual Raspberry Pi related bumps:
  - bump kernel for USB fix
  - bump userland for stereo and NTSC outputs
  - bump firmware for undisclosed changes (HDMI related?)

Regards,
Yann E. MORIN.


The following changes since commit 272759d8ff91b607233593a6e12a7fcf6255a588:

  libenca: Move build host tool to PRE_BUILD_HOOKS (2014-05-08 22:02:25 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to f466493038ac6b119a8eb14d5b2aa47e35bb7009:

  configs: bump kernel used for the RPi (2014-05-08 23:07:06 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/rpi-firmware: bump
      package/rpi-userland: bump version
      configs: bump kernel used for the RPi

 configs/raspberrypi_defconfig        | 2 +-
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 package/rpi-userland/rpi-userland.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
