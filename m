From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jul 2012 09:54:27 -0300
Subject: [Buildroot] [PATCH] libexif: security bump to version 0.6.21
Message-ID: <1342529667-7441-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-2812, CVE-2012-2813, CVE-2012-2814, CVE-2012-2836,
CVE-2012-2837, CVE-2012-2840, CVE-2012-2841 and CVE-2012-2845.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libexif/libexif.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 1832a7e..cd74fa0 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEXIF_VERSION = 0.6.20
+LIBEXIF_VERSION = 0.6.21
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
-- 
1.7.8.6
