From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Date: Wed, 18 Jan 2017 12:17:16 +0100
Subject: [Buildroot] [PATCH] package/xcb-util: remove obsolete dependency on
	gperf
Message-ID: <20170118111716.12640-1-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
---
 package/x11r7/xcb-util/xcb-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 4416d8075..7b913e2bb 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -12,6 +12,6 @@ XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_LICENSE = MIT
 
 XCB_UTIL_INSTALL_STAGING = YES
-XCB_UTIL_DEPENDENCIES = host-gperf libxcb
+XCB_UTIL_DEPENDENCIES = libxcb
 
 $(eval $(autotools-package))
-- 
2.11.0
