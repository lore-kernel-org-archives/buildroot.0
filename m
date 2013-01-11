From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 11 Jan 2013 16:13:49 +0100
Subject: [Buildroot] [PATCH 1/3] lzop: add host build
In-Reply-To: <1357917231-14194-1-git-send-email-fabio.porcedda@gmail.com>
References: <1357917231-14194-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1357917231-14194-2-git-send-email-fabio.porcedda@gmail.com>
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
1.8.0.3
