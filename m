From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Jun 2016 00:27:07 +0200
Subject: [Buildroot] [PATCH 1/4] libssh2: add host variant
In-Reply-To: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466807230-9052-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1466807230-9052-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow build of host variant of libssh2.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libssh2/libssh2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 221fac4..17882d5 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -38,3 +38,4 @@ LIBSSH2_CONF_OPTS += --without-libz
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.11
