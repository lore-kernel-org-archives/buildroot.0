From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 16:39:54 +0100
Subject: [Buildroot] [git commit] package/pixman: bump version to 0.34.0
Message-ID: <20160201224700.27EA77F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bd265c91722bf5ec5d38aa31297178a164d376d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.hash | 4 ++--
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 7a37220..d5b8934 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-December/002666.html
-sha1   11e93fed35deb9c89347e7a7da3060e5e5c89412	pixman-0.33.6.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2016-January/002672.html
+sha1	367698744e74d6d4f363041482965b9ea7fbe4a5	pixman-0.34.0.tar.bz2
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index fc43140..06070f0 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.33.6
+PIXMAN_VERSION = 0.34.0
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.bz2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
