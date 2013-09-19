From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 20:39:56 +0200
Subject: [Buildroot] [git commit] tslib: fix help text (white space / order)
Message-ID: <20130919184552.6E42B9A599@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ced4129aef2dd7f40c920c6be2607334c1f60d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 73b35df..95ee897 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TSLIB
 	bool "tslib"
 	help
-	    http://tslib.berlios.de/
+	  Tslib is an abstraction layer for touchscreen panel events.
 
-	    Tslib is an abstraction layer for touchscreen panel events.
+	  http://tslib.berlios.de/
