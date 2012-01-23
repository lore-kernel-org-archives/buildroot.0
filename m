From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Jan 2012 10:09:08 +0100
Subject: [Buildroot] [PATCH 1/3] jpeg: bump to v8d
Message-ID: <1327309750-7104-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
1.7.1.1
