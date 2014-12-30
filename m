From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 30 Dec 2014 03:07:23 +0100
Subject: [Buildroot] [PATCH 1/2] lcms2: Install into staging
Message-ID: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/lcms2/lcms2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5d22041..c2eda98 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -6,6 +6,7 @@
 
 LCMS2_VERSION = 2.5
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
+LCMS2_INSTALL_STAGING = YES
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 
-- 
1.9.1
