From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri,  1 Apr 2016 12:22:02 +0300
Subject: [Buildroot] [PATCH 0/2] qemu_xtensa_lx60 updates
Message-ID: <1459502524-23349-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this series adds new noMMU configuration: qemu_xtensa_lx60_nommu_defconfig
and switches qemu_xtensa_lx60_defconfig from dc232b to dc233c, so that
both configurations share the same core.

Max Filippov (2):
  configs/qemu_xtensa_lx60_defconfig: switch to dc233c
  configs: add qemu_xtensa_lx60_nommu_defconfig

 board/qemu/xtensa-lx60/linux-4.4-nommu.config |  37 ++++++++++++++++++++++++++
 board/qemu/xtensa-lx60/linux-4.4.config       |   4 +--
 board/qemu/xtensa-lx60/readme.txt             |   4 +--
 board/qemu/xtensa-lx60/xtensa_dc232b.tar      | Bin 747520 -> 0 bytes
 board/qemu/xtensa-lx60/xtensa_dc233c.tar      | Bin 0 -> 808960 bytes
 configs/qemu_xtensa_lx60_defconfig            |   2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig      |  34 +++++++++++++++++++++++
 7 files changed, 76 insertions(+), 5 deletions(-)
 create mode 100644 board/qemu/xtensa-lx60/linux-4.4-nommu.config
 delete mode 100644 board/qemu/xtensa-lx60/xtensa_dc232b.tar
 create mode 100644 board/qemu/xtensa-lx60/xtensa_dc233c.tar
 create mode 100644 configs/qemu_xtensa_lx60_nommu_defconfig

-- 
2.1.4
