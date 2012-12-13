From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Dec 2012 11:59:41 +0100
Subject: [Buildroot] [PATCH 1/2] lzop: add host build
Message-ID: <1355396382-14652-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Barebox needs host-lzop.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/lzop/lzop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 4ab8a4a..1f7c835 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -11,3 +11,4 @@ LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.0
