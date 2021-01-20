From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 22:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: set
 XSCREENSAVER_CPE_ID_VALID
Message-ID: <20210120211336.187265-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:xscreensaver_project:xscreensaver is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axscreensaver_project%3Axscreensaver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/xscreensaver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 7893e49d08..cb1e440ea1 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -10,6 +10,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
+XSCREENSAVER_CPE_ID_VALID = YES
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
-- 
2.29.2
