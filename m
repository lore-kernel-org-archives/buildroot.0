From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 12:28:09 -0300
Subject: [Buildroot] [PATCH] libcroco: fix typo in license file
Message-ID: <1453303689-30143-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it won't be saved.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcroco/libcroco.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 0cda9da..c4cb676 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -14,7 +14,7 @@ LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
 # NEWS states that it's only LGPL
 # Source code says v2.1+ even though COPYING.LIB is v2
 LIBCROCO_LICENSE = LGPLv2.1+
-LIBCROSO_LICENSE_FILES = COPYING.LIB
+LIBCROCO_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.4.10
