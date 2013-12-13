From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2013 15:53:10 +0100
Subject: [Buildroot] [git commit] zxing: bump to version 2.3.0
Message-ID: <20131213145725.7E0CD9C006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a74ea40ea051cc85f79e941add9dd9f7423ba9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zxing/zxing.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index e12b953..f58be08 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_VERSION = 2.0
+ZXING_VERSION = 2.3.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
 ZXING_LICENSE = Apache v2.0
