From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:15 +0200
Subject: [Buildroot] [PATCH 08/24] libconfuse: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-9-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libconfuse/libconfuse.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 089e12cdb52c..f9cecbcd17c2 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -14,4 +14,3 @@ LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.1.0
