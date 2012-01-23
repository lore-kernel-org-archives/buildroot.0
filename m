From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Jan 2012 10:48:53 +0100
Subject: [Buildroot] [git commit] jpeg: bump to v8d
Message-ID: <20120123095016.1990690384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90a939e2bdd6c121acd7d95e5b6fe0fa8e1e3dc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index bac5f3e..555c3e1 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -3,7 +3,7 @@
 # jpeg (libraries needed by some apps)
 #
 #############################################################
-JPEG_VERSION = 8c
+JPEG_VERSION = 8d
 JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
