From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 23 Apr 2015 10:50:56 +0100
Subject: [Buildroot] [PATCH 1/2] QEMU: bump to 2.2.1
Message-ID: <1429782657-6283-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump QEMU to 2.2.1

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1202df77c5e4..b73127b24748 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.1.2
+QEMU_VERSION = 2.2.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
2.3.5
