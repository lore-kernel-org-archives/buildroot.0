From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Sep 2016 14:40:07 +0100
Subject: [Buildroot] [PATCH 1/6] qemu: bump version to 2.7.0
Message-ID: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
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
index 2d6d96c..572a5c9 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,2 +1,2 @@
 # Locally computed, tarball verified with GPG signature
-sha256 c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec  qemu-2.6.0.tar.bz2
+sha256 326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53  qemu-2.7.0.tar.bz2
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5ca0e77..42dd9c2 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.6.0
+QEMU_VERSION = 2.7.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
-- 
2.7.3
