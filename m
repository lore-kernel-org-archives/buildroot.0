From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 22:40:51 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-updates
Message-ID: <cover.1372019882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few versions bumps:
  - rpi-firmware, for a few fixes
  - rpi_defconfig, for a new kernel with some fixes and enhancements
  - tvheadend, for a few libav-related fixes

And a new package, w_scan, to scan for DVB channels without a pre-tuned
config file (the other dvb-apps scan utils require a pre-tuned config
file).

Regards,
Yann E. MORIN


The following changes since commit 164f9fef0f80a7a38221787be8bf8a6d1684a107:

  toolchain-external: bump to Linaro AArch64 2013.06 (2013-06-23 21:55:55 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to a4416db33352923370280841140fb56daa85fd86:

  package/w_scan: new package (2013-06-23 22:29:07 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      package/rpi-firmware: version bump for HDMI and audio fixes
      configs: bump kernel in rpi_defconfig for misc fixes
      package/tvheadend: bump version for libav fixes
      package/w_scan: new package

 configs/rpi_defconfig                |  2 +-
 package/Config.in                    |  1 +
 package/rpi-firmware/rpi-firmware.mk |  2 +-
 package/tvheadend/tvheadend.mk       |  2 +-
 package/w_scan/Config.in             |  9 +++++++++
 package/w_scan/w_scan.mk             | 13 +++++++++++++
 6 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 package/w_scan/Config.in
 create mode 100644 package/w_scan/w_scan.mk
-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
