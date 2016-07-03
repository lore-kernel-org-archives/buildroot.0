From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:32:43 +0200
Subject: [Buildroot] [git commit] xcb-proto: add explicit dependencies for
	host variant
Message-ID: <20160703073818.D73FC7FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e4eeea58cbc625b71727c818324bb44d7ca4d5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 1c847eb..84555d0 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -13,6 +13,7 @@ XCB_PROTO_LICENSE_FILES = COPYING
 XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
+HOST_XCB_PROTO_DEPENDENCIES = host-python
 
 # xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
 # xml / python files, so ensure these expand to their full (host) paths
