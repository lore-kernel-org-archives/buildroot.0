From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:07:34 +0200
Subject: [Buildroot] [git commit] tslib: correct option text
Message-ID: <20130411140828.9AF499B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62c92adb5cfd46eca8b806da816a906faf4465bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Option text should only be the package name, descriptions go in help text.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 76f1349..73b35df 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_TSLIB
-	bool "libts - The Touchscreen tslib Library"
+	bool "tslib"
 	help
 	    http://tslib.berlios.de/
 
