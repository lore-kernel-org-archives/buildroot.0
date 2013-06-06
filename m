From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  7 Jun 2013 00:23:04 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem-misc-updates
Message-ID: <cover.1370557253.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are the last two bumps for the RPi:
  - rpi-firmware: bump to get fixes and more audio/video codecs
  - rpi-userland: bump to get fixes


Changes v1 -> v2:
  - further bump rpi-firmware
  - bump rpi-userland too
  - drop applied patches
  - defer rpi-firmware selectiv install for now


Regards,
Yann E. MORIN


The following changes since commit 013365238f0b00f01dcc173edf2f3b6e37f7beb1:

  tslib: fix github tarball to use commit id (2013-06-06 23:09:16 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to c8dadc3da902bfffb5a43b17ac67c1eb3a82ee2c:

  package/rpi-userland: bump version (2013-06-07 00:04:40 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-firmware: update
      package/rpi-userland: bump version

 package/rpi-firmware/cmdline.txt     | 1 +
 package/rpi-firmware/config.txt      | 1 -
 package/rpi-firmware/rpi-firmware.mk | 5 ++++-
 package/rpi-userland/rpi-userland.mk | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 package/rpi-firmware/cmdline.txt
-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
