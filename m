From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:10:39 -0700
Subject: [Buildroot] [PATCH 05/27] package/less: bump to version 551
Message-ID: <20190908161039.25979-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

updated _SITE

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/less/less.hash | 7 ++++++-
 package/less/less.mk   | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 23febacac8..202ccf977c 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,3 +1,8 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-sha256 503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2  less-530.tar.gz
+# http://www.greenwoodsoftware.com/less/less-551.sig
+
+# Locally calculated
+sha256 ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d less-551.tar.gz
+# Locally calculated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 4f6a7c5e77..3e58d39ca5 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LESS_VERSION = 530
-LESS_SITE = $(BR2_GNU_MIRROR)/less
+LESS_VERSION = 551
+LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
 LESS_DEPENDENCIES = ncurses
-- 
2.20.1
