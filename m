From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:37:34 +0200
Subject: [Buildroot] [git commit] jquery-sparkline: bump to version 2.1.1
Message-ID: <20130412130253.427309B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b8ecc73468b117d7d83fd7231a58b5c612f9df4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-sparkline/jquery-sparkline.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 76adad6..aa6395c 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -1,6 +1,7 @@
-JQUERY_SPARKLINE_VERSION = 2.1
+JQUERY_SPARKLINE_VERSION = 2.1.1
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
+JQUERY_SPARKLINE_LICENSE = BSD-3c
 
 define JQUERY_SPARKLINE_EXTRACT_CMDS
 	cp $(DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
