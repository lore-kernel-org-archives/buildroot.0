From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 23:33:10 +0200
Subject: [Buildroot] [PATCH v1] evemu: bump version to 2.3.1
Message-ID: <1444944790-26362-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2015-October/001221.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 9d7bb50..f7a0cc6 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-August/001190.html
-sha256 e0f79808959d1b1f307a3d5add8ee9e5786d926e9aeb0045dadb85c7350d0a3c evemu-2.2.0.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-October/001221.html
+sha256 5b0197735f9effa25563b0412c560354bee34f8263eaddb00dd996e6ff56eb6a evemu-2.3.1.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index ad56888..2fce723 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.2.0
+EVEMU_VERSION = 2.3.1
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
-- 
2.1.4
