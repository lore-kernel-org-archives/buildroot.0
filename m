From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Nov 2016 14:41:36 +0000
Subject: [Buildroot] [PATCH 2/2] mesa3d-headers: bump version to 13.0.0
In-Reply-To: <20161102144136.34786-1-Vincent.Riera@imgtec.com>
References: <20161102144136.34786-1-Vincent.Riera@imgtec.com>
Message-ID: <20161102144136.34786-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3080afe..b3b80eb 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 12.0.3
+MESA3D_HEADERS_VERSION = 13.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
-- 
2.10.1
