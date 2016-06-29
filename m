From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:31 +0200
Subject: [Buildroot] [PATCH 24/24] ustr: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-25-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/ustr/ustr.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 174f05565aef..5dcd3c460f49 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -24,4 +24,3 @@ USTR_INSTALL_STAGING = YES
 USTR_MAKE_OPTS = all all-shared
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
