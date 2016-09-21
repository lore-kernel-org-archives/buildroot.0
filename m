From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Sep 2016 22:21:35 +0200
Subject: [Buildroot] [PATCH v1] evemu: bump version to 2.5.0
Message-ID: <1474489295-22437-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

[1] https://lists.freedesktop.org/archives/input-tools/2016-September/001330.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 1264bed..5e653f7 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-April/001274.html
-sha256 0706ea5a830203f9cdb30c0e10c8c41d2427128ba9041543a5ae157fa3b4a30e evemu-2.4.0.tar.xz
+# Hash from https://lists.freedesktop.org/archives/input-tools/2016-September/001330.html
+sha256 541cc138f0215b7d0cd4ad5e6bb1402518ffc5e31294c36bb67b4ff1791bb27f evemu-2.5.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 992a1f7..4f59789 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.4.0
+EVEMU_VERSION = 2.5.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
-- 
2.8.1
