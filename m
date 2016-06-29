From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:16 +0200
Subject: [Buildroot] [PATCH 09/24] libpthread-stubs: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-10-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libpthread-stubs/libpthread-stubs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index 856793c4e055..182aeb4d3089 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -17,4 +17,3 @@ LIBPTHREAD_STUBS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
