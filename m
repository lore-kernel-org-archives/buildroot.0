From: Andi Shyti <andi.shyti@gmail.com>
Date: Sun, 26 Jun 2016 17:07:40 +0300
Subject: [Buildroot] [PATCH 0/2] Odroid XU4 support
Message-ID: <1466950062-31783-1-git-send-email-andi@etezian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds support for the Odroid XU4 board.

The first patch adds the first two stages of boot firmare and the
trust zone, necessary to boot the device.

While the second patch adds the actual support of the board.

Andi

Andi Shyti (2):
  package: add Odroid BL bootloader binaries
  board: add support for the Odroid XU4 board

 board/odroid-xu4/boot.cmd            |  10 +++
 board/odroid-xu4/readme.txt          | 165 +++++++++++++++++++++++++++++++++++
 configs/odroid-xu4_defconfig         |  10 +++
 package/Config.in                    |   1 +
 package/odroid-xu-bl/Config.in       |   6 ++
 package/odroid-xu-bl/odroid-xu-bl.mk |  18 ++++
 6 files changed, 210 insertions(+)
 create mode 100644 board/odroid-xu4/boot.cmd
 create mode 100644 board/odroid-xu4/readme.txt
 create mode 100644 configs/odroid-xu4_defconfig
 create mode 100644 package/odroid-xu-bl/Config.in
 create mode 100644 package/odroid-xu-bl/odroid-xu-bl.mk

-- 
2.8.1
