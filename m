From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 16:40:38 +0100
Subject: [Buildroot] [PATCH] qemu: bump version to 2.5.1
Message-ID: <1459352438-40227-1-git-send-email-Vincent.Riera@imgtec.com>
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
index cccb059..74e9fb8 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 3443887401619fe33bfa5d900a4f2d6a79425ae2b7e43d5b8c36eb7a683772d4  qemu-2.5.0.tar.bz2
+sha256 028752c33bb786abbfe496ba57315dc5a7d0a33b5a7a767f6d7a29020c525d2c  qemu-2.5.1.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1b08b42..4397367 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.5.0
+QEMU_VERSION = 2.5.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
-- 
2.7.3
