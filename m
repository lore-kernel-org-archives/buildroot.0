From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Sep 2017 10:25:36 +0930
Subject: [Buildroot] [PATCH 0/2] ppc64 little endian defconfig
Message-ID: <20170919005538.1482-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This adds bumps the existing ppc64 defconfig to the latest kernel, and adds a
ppc64le defconfig so we have coverage of the le toolchain in buildroot.

I did a build test and booted it in Qemu.

Cheers,

Joel


Joel Stanley (2):
  configs: qemu_ppc64_pseries: Update to kernel 4.13.1
  configs: Add qemu_ppc64le_pseries

 configs/qemu_ppc64_pseries_defconfig   |  6 +++---
 configs/qemu_ppc64le_pseries_defconfig | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 configs/qemu_ppc64le_pseries_defconfig

-- 
2.14.1
