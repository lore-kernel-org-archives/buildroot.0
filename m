From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:45:46 +0200
Subject: [Buildroot] [git commit] package/w_scan: do not line-up variables
Message-ID: <20140602111141.6C60E9CE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac4edbccc7eb62e1720e06921d07564d5326a1f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/w_scan/w_scan.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index 5ca02b8..86bd34e 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-W_SCAN_VERSION              = 20130331
-W_SCAN_SOURCE               = w_scan-$(W_SCAN_VERSION).tar.bz2
-W_SCAN_SITE                 = http://wirbel.htpc-forum.de/w_scan
-W_SCAN_LICENSE              = GPLv2+
-W_SCAN_LICENSE_FILES        = COPYING
+W_SCAN_VERSION = 20130331
+W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
+W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
+W_SCAN_LICENSE = GPLv2+
+W_SCAN_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-W_SCAN_DEPENDENCIES        += libiconv
-W_SCAN_CONF_ENV            += LIBS=-liconv
+W_SCAN_DEPENDENCIES += libiconv
+W_SCAN_CONF_ENV += LIBS=-liconv
 endif
 
 $(eval $(autotools-package))
