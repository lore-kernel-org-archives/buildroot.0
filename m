From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:26 +0200
Subject: [Buildroot] [PATCH 19/24] xutil_util-macros: drop unused host
	variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-20-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/xutil_util-macros/xutil_util-macros.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index 1451a0698dee..a13012b635dd 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -14,4 +14,3 @@ XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
