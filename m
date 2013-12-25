From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Dec 2013 21:29:02 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/bumps
Message-ID: <cover.1388003226.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series with un-assorted changes:
  - bump the kernel we use for the raspberrypi_defconfig
  - bump the linux-firmware version
  - add install for a new firmware for Ralink 9170 boards
  - make linux-firmware behave properly for legal-info

Regards,
Yann E. MORIN.


The following changes since commit 569b842985713d02f34367621ed7a6b6e5efdf73:

  package/cryptodev: switch to package-defined providers (2013-12-25 18:21:55 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 32877964f13b884a3ad67eb1a1552b2a7d599434:

  package/linux-firmware: install license files with 'make legal-info' (2013-12-25 21:21:55 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      configs: bump kernel for raspberrypi_defconfig
      package/linux-firmware: bump version
      package/linux-firmware: add Atheros 9170 firmware
      package/linux-firmware: install license files with 'make legal-info'

 configs/raspberrypi_defconfig            |   4 +-
 package/linux-firmware/Config.in         |   5 ++
 package/linux-firmware/linux-firmware.mk | 147 +++++++++++++++++++++----------
 3 files changed, 108 insertions(+), 48 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
