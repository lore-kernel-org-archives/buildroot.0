From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2015 12:47:58 +0100
Subject: [Buildroot] [PATCH 1/4] package/nettle: add host variant
Message-ID: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nettle/nettle.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index a25bb24..b65a812 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -33,3 +33,4 @@ endef
 NETTLE_POST_EXTRACT_HOOKS += NETTLE_DITCH_DEBUGGING_CFLAGS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
