From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:25 +0530
Subject: [Buildroot] [PATCH 3/9] libraw: use SPDX short identifier for CDDL
	license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-3-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/libraw/libraw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index bb8edf7..589ff89 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,7 +18,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
-LIBRAW_LICENSE = LGPL-2.1 or CDDL 1.0 or LibRaw Software License 27032010
+LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.7.4
