From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:34:59 +0200
Subject: [Buildroot] [git commit] xlib_libXdmcp: add explicit dependencies
	for host variant
Message-ID: <20160703073819.79FC5807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49fca4ef63e4fc5b9a85f4a7bbe627e1ce0451fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 119c018..ec1b861 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -11,6 +11,7 @@ XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
+HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
