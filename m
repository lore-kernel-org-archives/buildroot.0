From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 25 Apr 2020 16:30:37 +0200
Subject: [Buildroot] [PATCH] package/rauc: bump to version 1.3
Message-ID: <1587825037-9766-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://github.com/rauc/rauc/releases/tag/v1.3

And update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/rauc/rauc.hash | 6 +++---
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 5476034..b73eb60 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.2/rauc-1.2.tar.xz.asc
-sha256 224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661 rauc-1.2.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.3.tar.xz.asc
+sha256  4f6144447254753fcd19f2c5c70e79fa91d27253185b8928436f01528aa65e6c  rauc-1.3.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 5a208e0..5c5bd99 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.2
+RAUC_VERSION = 1.3
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.7.4
