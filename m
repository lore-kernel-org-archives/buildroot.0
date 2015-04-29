From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 29 Apr 2015 13:21:29 +0100
Subject: [Buildroot] [PATCH] QEMU: Bump to 2.3.0
Message-ID: <1430310089-28679-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump QEMU to 2.3.0

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 15962af4b5fd..4f7983f60723 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 4617154c6ef744b83e10b744e392ad111dd351d435d6563ce24d8da75b1335a0 qemu-2.2.1.tar.bz2
+sha256 b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588 qemu-2.3.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index decfc259d2e3..d565c88bcd76 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.2.1
+QEMU_VERSION = 2.3.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
2.3.6
