From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 11:16:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: use host-xxx-package macros
Message-ID: <20191001091628.7760-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/libev/libev.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 2b2d5db004..38b0530f62 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -18,3 +18,4 @@ endef
 LIBEV_POST_PATCH_HOOKS += LIBEV_DISABLE_EVENT_H_INSTALL
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
