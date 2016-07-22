From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 00:22:14 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.20.10
Message-ID: <1469226134-26306-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"This will be the last release in the e20 series"

https://www.enlightenment.org/news/e-0.20.10-release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index fad14b7..ecfe537 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.20.9-release
-sha256	db792ad4d97b2523ff0bfc2c911bb3fea4b1eda60400871f4b78bc3ae2f1d1be 	enlightenment-0.20.9.tar.xz
+# From https://www.enlightenment.org/news/e-0.20.10-release
+sha256	59fd447d120d91d18958a31a5827f97842cc472f2e22f132b2c7d4d208944baf 	enlightenment-0.20.10.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 6fe8f45..e8fee3f 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.20.9
+ENLIGHTENMENT_VERSION = 0.20.10
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.5.5
