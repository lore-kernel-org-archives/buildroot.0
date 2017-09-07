From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Sep 2017 05:37:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-headers: bump version to
	17.2.0
Message-ID: <20170907033741.4716-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to bump this package in
https://git.buildroot.net/buildroot/commit/package/mesa3d?id=88b5e583a3b9389159c0b008f140aaa1cf578a3c

Fixes
http://autobuild.buildroot.net/results/ef2/ef23996ba10a2143087c3ff0b7549f4acbbe6777/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c30c67366..cbea79172 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.8
+MESA3D_HEADERS_VERSION = 17.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
