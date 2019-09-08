From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 00:46:48 +0200
Subject: [Buildroot] [git commit] package/less: bump to version 551
Message-ID: <20190908224459.62CE68D53A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=425a09ef5e148472eca0c8a75585f995e0f9f633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

updated _SITE

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/less/less.hash | 5 ++++-
 package/less/less.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 23febacac8..57a857efe4 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,3 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-sha256 503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2  less-530.tar.gz
+# http://www.greenwoodsoftware.com/less/less-551.sig
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
