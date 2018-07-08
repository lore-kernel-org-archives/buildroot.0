From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Jul 2018 02:16:59 -0300
Subject: [Buildroot] [PATCH 3/5] libpng: use $() to reference make variables
 instead of ${}
In-Reply-To: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
Message-ID: <20180708051701.3153-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/libpng/libpng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f8594c808f..ace62cd876 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -7,7 +7,7 @@
 LIBPNG_VERSION = 1.6.34
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = Libpng
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
-- 
2.17.1
