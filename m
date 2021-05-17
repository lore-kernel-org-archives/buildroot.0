From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 17 May 2021 21:18:58 +0200
Subject: [Buildroot] [git commit] package/mesa3d-headers: remove spurious
 empty line
Message-ID: <20210517185117.3C50A872F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfb045af5b4fc4c55a5674945b90d670c5fee68c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detected by check-package

Fixes: 7fa481437e71484aa7064398e69aa63cdabb86b2

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d86ad929f8..de245a4625 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -21,7 +21,6 @@ MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
 MESA3D_HEADERS_CPE_ID_VENDOR = mesa3d
 MESA3D_HEADERS_CPE_ID_PRODUCT = mesa
 
-
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
 MESA3D_HEADERS_INSTALL_TARGET = NO
