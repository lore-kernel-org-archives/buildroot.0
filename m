From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 19 Sep 2013 09:12:57 +0200
Subject: [Buildroot] [PATCH] tslib: bump version to 1.1
Message-ID: <1379574777-9399-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/tslib/tslib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 7f5aa21..ebc33b2 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
+TSLIB_VERSION = e2e03ef7192a7e0a84f725522be17a61b21b41c5
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
-- 
1.7.7
