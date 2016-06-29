From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:18 +0200
Subject: [Buildroot] [PATCH 11/24] libsodium: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-12-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libsodium/libsodium.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 13dba8dec3f1..bd6f58d343a4 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -15,4 +15,3 @@ LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
