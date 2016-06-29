From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:14 +0200
Subject: [Buildroot] [PATCH 07/24] libatomic_ops: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-8-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libatomic_ops/libatomic_ops.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index fd457267502b..01e9e9c9a261 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -24,4 +24,3 @@ LIBATOMIC_OPS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
