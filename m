From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 23:21:04 +0200
Subject: [Buildroot] [git commit] zxing: add version of the Apache license
Message-ID: <20120822212213.EE43697260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d10c263b7fe6c389561ead92ce0c8453c3a77fa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zxing/zxing.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 543d038..851aef6 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -6,7 +6,7 @@
 ZXING_VERSION = 2.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
-ZXING_LICENSE = Apache
+ZXING_LICENSE = Apache v2.0
 ZXING_LICENSE_FILES = COPYING
 ZXING_INSTALL_STAGING = YES
 
