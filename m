From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 11:21:32 -0300
Subject: [Buildroot] [PATCH 7/9] libpng: bump to version 1.4.5
In-Reply-To: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296138094-502-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 82b88da..699561b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,11 +3,10 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.4
+LIBPNG_VERSION = 1.4.5
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
-LIBPNG_LIBTOOL_PATCH = NO
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-- 
1.7.3.4
