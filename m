From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 18:28:48 +0100
Subject: [Buildroot] [git commit] package/mesa3d-headers: fix legal-info
Message-ID: <20201103172119.5F31086D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ddcf96157bd29c9c17a7d4811beebecf208516c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9d874c9051cf46ef29b763ad8db0b638f3761605 forgot to update
MESA3D_HEADERS_LICENSE_FILES

Fixes:
 - http://autobuild.buildroot.org/results/d75e90863525d4abd3d83f3f947261695a2f0d65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 67dc765840..afb2e799c4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -17,7 +17,7 @@ MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
-MESA3D_HEADERS_LICENSE_FILES = docs/license.html
+MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
 
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
