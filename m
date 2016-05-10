From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 10 May 2016 12:39:47 +0100
Subject: [Buildroot] [PATCH] qemu: bump version to 2.5.1.1
Message-ID: <1462880387-14117-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 74e9fb8..d35960a 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 028752c33bb786abbfe496ba57315dc5a7d0a33b5a7a767f6d7a29020c525d2c  qemu-2.5.1.tar.bz2
+sha256 28d9946e43765a44ccccca3cba5f4f9034f2759ec1f2ce16594ddb6776c8efe6  qemu-2.5.1.1.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 522910e..5fa95bb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.5.1
+QEMU_VERSION = 2.5.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
-- 
2.7.3
