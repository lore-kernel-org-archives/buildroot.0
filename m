From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Sep 2017 22:35:27 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 2.7.0
Message-ID: <20170927203527.28465-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

[1] https://lists.freedesktop.org/archives/input-tools/2017-September/001416.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index b5f0bf5d55..7d45eb3e5b 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 ed81dd4552ffeb92c346b47e56b249c67f1cb37d5b31fc073ea0ad4858ae3dcc  evemu-2.6.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2017-September/001416.html
+sha256 78c9400d55eeeb5ab75161360543f9376438c4da4934cb34cdda5b46021ae379 evemu-2.7.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index fba45216ce..02e5abdb8f 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.6.0
+EVEMU_VERSION = 2.7.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
-- 
2.14.1
