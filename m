From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 19 May 2021 18:10:09 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mesa3d-headers:
 remove spurious empty line
Message-ID: <20210519154120.3C7C180287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec602113a66e7cc6297a1d0faaddc48d59345fcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Detected by check-package

Fixes: 7fa481437e71484aa7064398e69aa63cdabb86b2

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dfb045af5b4fc4c55a5674945b90d670c5fee68c)
---
 package/mesa3d-headers/mesa3d-headers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6389b2501b..2a03beb29d 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -21,7 +21,6 @@ MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
 MESA3D_HEADERS_CPE_ID_VENDOR = mesa3d
 MESA3D_HEADERS_CPE_ID_PRODUCT = mesa
 
-
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
 MESA3D_HEADERS_INSTALL_TARGET = NO
