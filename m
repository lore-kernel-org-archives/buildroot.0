From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 09:15:19 -0300
Subject: [Buildroot] [PATCH 1/5] libevent: add host variant
Message-ID: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libevent/libevent.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index a6def1a..14ebf72 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -20,3 +20,4 @@ LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.5
