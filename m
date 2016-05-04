From: Simon Maes <simonn.maes@gmail.com>
Date: Wed,  4 May 2016 09:47:58 +0200
Subject: [Buildroot] [PATCH 5/6] vde2: enable building host package
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <1462348079-7631-5-git-send-email-simonn.maes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation of enabling vde2 support in host-qemu package.

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
---
 package/vde2/vde2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index bad758d..13fecd3 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -38,3 +38,4 @@ VDE2_CONF_OPTS = \
 VDE2_MAKE = $(MAKE1)
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.6.2
