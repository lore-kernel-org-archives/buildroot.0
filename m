From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:36 +0200
Subject: [Buildroot] [PATCH 05/21] package/w_scan: do not line-up variables
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <517df36804751594e8fe8affc408570d3b4468da.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/w_scan/w_scan.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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
-- 
1.8.3.2
