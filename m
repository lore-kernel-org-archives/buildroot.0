From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Dec 2016 22:00:16 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to version 0.21.5
Message-ID: <1481576416-11145-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug fix release:
https://www.enlightenment.org/news/e-0.21.5-release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index ba66918..1548f20 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.21.4-release
-sha256	0ed1a7c768017b2afa02cf94d9c532e9f960b6a4a7e79954770424dfb6b1bf20 	enlightenment-0.21.4.tar.xz
+# From https://www.enlightenment.org/news/e-0.21.5-release
+sha256	f0745a660f70851c4ada9866b2a525185bfc5cd1685aa86e4cdb68f2c1c154bb 	enlightenment-0.21.5.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index c936140..7037afe 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.4
+ENLIGHTENMENT_VERSION = 0.21.5
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.5.5
