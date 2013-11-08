From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Fri,  8 Nov 2013 13:11:56 +0100
Subject: [Buildroot]  [PATCH] gutenprint: fix download url
Message-ID: <1383912716-31202-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 package/gutenprint/gutenprint.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 33abf48..0924cb6 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUTENPRINT_VERSION = 5.2.9
-GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPLv2+
 GUTENPRINT_LICENSE_FILES = COPYING
-- 
1.8.3.1
