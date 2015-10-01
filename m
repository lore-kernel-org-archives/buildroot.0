From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Oct 2015 15:27:35 +0100
Subject: [Buildroot] [PATCH] qemu: bump to version 2.4.0.1
Message-ID: <1443709655-17120-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qemu/qemu.hash |    2 +-
 package/qemu/qemu.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 4f7983f..c563271 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588 qemu-2.3.0.tar.bz2
+sha256 ecfe8b88037e41e817d72c460c56c6a0b573d540d6ba38b162d0de4fd22d1bdb  qemu-2.4.0.1.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0620804..94e1bcf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.3.0
+QEMU_VERSION = 2.4.0.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
1.7.1
