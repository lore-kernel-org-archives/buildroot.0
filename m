From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:23 +0200
Subject: [Buildroot] [PATCH 54/69] xutil_makedepend: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-55-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 81e348ed9645..6fd3c1ae36bf 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -11,6 +11,7 @@ XUTIL_MAKEDEPEND_LICENSE = MIT
 XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
