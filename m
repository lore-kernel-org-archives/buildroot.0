From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  8 Apr 2013 15:36:20 +0200
Subject: [Buildroot] [PATCH] tslib: bump version
Message-ID: <1365428180-13469-1-git-send-email-yegorslists@googlemail.com>
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
index 8533cf9..2c07272 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,7 +3,7 @@
 # tslib
 #
 #############################################################
-TSLIB_VERSION = 412d99d
+TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
-- 
1.7.7
