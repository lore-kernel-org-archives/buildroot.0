From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:49:00 +0100
Subject: [Buildroot] [git commit branch/next] package: qemu: bump version to
	2.8.0
Message-ID: <20170211160037.8D49F818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f56b13897b9f30c78d7ccd78a25b1e985179d2ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This adds a CPU definition for the Cortex A7 along with improvements described
here: http://wiki.qemu-project.org/ChangeLog/2.8

Tested on an ARM Cortex A7 target (both target and host builds). The change log
does not describe any incompatible changes that would affect buildroot targets
as far as I am aware.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 572a5c9..19cb306 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53  qemu-2.7.0.tar.bz2
+sha256 dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62  qemu-2.8.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 66efcba..e744556 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.7.0
+QEMU_VERSION = 2.8.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
