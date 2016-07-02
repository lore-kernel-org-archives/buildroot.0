From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:11 +0200
Subject: [Buildroot] [PATCH 42/69] xcb-proto: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-43-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 1c847ebc8556..84555d07f0f3 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -13,6 +13,7 @@ XCB_PROTO_LICENSE_FILES = COPYING
 XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
+HOST_XCB_PROTO_DEPENDENCIES = host-python
 
 # xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
 # xml / python files, so ensure these expand to their full (host) paths
-- 
2.1.0
