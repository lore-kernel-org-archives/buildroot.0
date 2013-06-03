From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 16:36:12 +0200
Subject: [Buildroot] [git commit] libbsd: correct license file reference
Message-ID: <20130603143944.6331F9A893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5770b89b63cc7bb7f484b4a90d17e24623cbbc7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuilder error:
http://autobuild.buildroot.net/results/ccd/ccd2f3fe69a3e0321685daf95f85eca5ba2d64cf/

[Peter: use COPYING instead]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libbsd/libbsd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 3af1002..2466b01 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -8,7 +8,7 @@ LIBBSD_VERSION         = 0.4.2
 LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
 LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE         = BSD-3c MIT
-LIBBSD_LICENSE_FILES   = LICENSE
+LIBBSD_LICENSE_FILES   = COPYING
 
 # man-pages are BSD-4c, so that license only matters
 # if doc is kept in the target rootfs
