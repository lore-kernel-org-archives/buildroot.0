From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 09:35:52 +0200
Subject: [Buildroot] [git commit] jpeg: bump version
Message-ID: <20110714075411.4C12F8A5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1e0bc5275328f22d3e18d8658c882152d7994c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 8919a3a..30a6225 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -3,7 +3,7 @@
 # jpeg (libraries needed by some apps)
 #
 #############################################################
-JPEG_VERSION = 8b
+JPEG_VERSION = 8c
 JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
-- 
1.7.3.4
