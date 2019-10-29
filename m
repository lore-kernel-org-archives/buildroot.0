From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 29 Oct 2019 18:41:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump to v1.2
Message-ID: <20191029174122.97086-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index ad4f74409e..54760347c7 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
-sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.2/rauc-1.2.tar.xz.asc
+sha256 224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661 rauc-1.2.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 88a1006bc0..9edd9d466c 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.1
+RAUC_VERSION = 1.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.21.0
