From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 14 May 2014 13:47:36 +0200
Subject: [Buildroot] [PATCH] mtr: drop unneeded 'call' from
	autotools-package invocation
Message-ID: <1400068056-4870-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtr/mtr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index a96bf0c..19dfc48 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -21,4 +21,4 @@ endif
 
 MTR_POST_PATCH_HOOKS += MTR_DISABLE_RES_NINIT
 
-$(eval $(call autotools-package))
+$(eval $(autotools-package))
-- 
1.9.1
