From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jul 2012 14:19:41 -0300
Subject: [Buildroot] [PATCH] libpng: security bump to version 1.4.12
Message-ID: <1343323181-26998-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-3386

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index dd295c6..6edabc4 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPNG_VERSION = 1.4.11
+LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
-- 
1.7.8.6
