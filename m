From: Sven Neumann <neumann@teufel.de>
Date: Tue, 25 Feb 2014 13:44:59 +0100
Subject: [Buildroot] [PATCH] libpng: fix download location
In-Reply-To: <87zjlfjxl5.fsf@dell.be.48ers.dk>
References: <87zjlfjxl5.fsf@dell.be.48ers.dk>
Message-ID: <1393332299-17158-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/libpng/libpng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f8b4d98..b489dd9 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -7,7 +7,7 @@
 LIBPNG_VERSION = 1.6.8
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/older-releases/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
-- 
1.8.3.2
