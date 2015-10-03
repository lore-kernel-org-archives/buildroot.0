From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 23:39:54 +0200
Subject: [Buildroot] [git commit] package/pixman: bump version to 0.32.8
Message-ID: <20151003214139.613F281926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3db431619072b95fada2edd1ae5a30e901a3a647
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix .hash comment as pointed out by Vincent]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.hash |    4 ++--
 package/pixman/pixman.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index c6ec14e..04e2620 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,2 @@
-# From http://cairographics.org/releases/pixman-0.32.6.tar.gz.sha1
-sha1	8791343cbf6d99451f4d08e8209d6ac11bf96df2	pixman-0.32.6.tar.gz
+# From http://cairographics.org/releases/pixman-0.32.8.tar.gz.sha1
+sha1	c1119bbdb587c56009b653e6f81c083f98a20135	pixman-0.32.8.tar.gz
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index a244ea8..0e4b0b9 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.32.6
+PIXMAN_VERSION = 0.32.8
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
