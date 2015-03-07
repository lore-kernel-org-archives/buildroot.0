From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Mar 2015 09:13:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/mesa3d-headers: bump version to
	10.4.6
In-Reply-To: <1425716008-32544-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425716008-32544-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1425716008-32544-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e20859e..5e113ce 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.4.5
+MESA3D_HEADERS_VERSION = 10.4.6
 MESA3D_HEADERS_SOURCE = MesaLib-$(MESA3D_HEADERS_VERSION).tar.bz2
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
