From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:13 +0100
Subject: [Buildroot] [PATCH 0/5] Misc bumps (branch yem/bumps)
Message-ID: <cover.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few bumps to:

  - linux-firmware: fix a firmware file, bump for new firmwares, offer
    alternatives for iwlwifi revisions

  - rpi-firmware: bump for fixes

  - tvheadend: bump for improvements and fixes all over the tree

Regards,
Yann E. MORIN.


The following changes since commit ca4e9a78732bcacddd0c91ab35ee39a60ff040aa:

  jack2: fix missing alsa-lib feature dependency (2014-03-10 13:13:03 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to 7fe2dbaa3e609fa6bd7d80f29daf6bb28d73c64d:

  package/tvheadend: bump version (2014-03-10 18:15:01 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/linux-firmware: fix typo in firmware file for cxgb4
      package/linux-firmware: bump for new firmwares
      package/linux-firmware: different iwlwifi3160/7260 firmwares for different kernels
      package/rpi-firmware: bump version
      package/tvheadend: bump version

 package/linux-firmware/Config.in                   | 28 ++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk           |  8 +++---
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 .../tvheadend-001-no-auto-download-dvbscans.patch  | 30 +++++++++++-----------
 .../tvheadend/tvheadend-002-no-check_config.patch  |  8 +++---
 .../tvheadend/tvheadend-003-remove-werror.patch    |  9 ++++---
 .../tvheadend-004-dont-run-compiled-code.patch     | 21 ---------------
 package/tvheadend/tvheadend.mk                     |  2 +-
 8 files changed, 58 insertions(+), 50 deletions(-)
 delete mode 100644 package/tvheadend/tvheadend-004-dont-run-compiled-code.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
