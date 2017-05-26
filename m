From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 26 May 2017 14:16:07 +0100
Subject: [Buildroot] [PATCH next 2/2] mesa3d-headers: bump version to 17.1.1
In-Reply-To: <20170526131607.34436-1-Vincent.Riera@imgtec.com>
References: <20170526131607.34436-1-Vincent.Riera@imgtec.com>
Message-ID: <20170526131607.34436-2-Vincent.Riera@imgtec.com>
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
index fbde9ec33..ce49e18ab 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.6
+MESA3D_HEADERS_VERSION = 17.1.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
-- 
2.13.0
