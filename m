From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 20:38:32 +0200
Subject: [Buildroot] [git commit] tslib: bump version to 1.1
Message-ID: <20130919184552.6868F9B7F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0dabf9ea84bb4b312c521d95d9b259b5e6ac39f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use 1.1 tag]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/tslib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 7f5aa21..751d01e 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
+TSLIB_VERSION = 1.1
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
