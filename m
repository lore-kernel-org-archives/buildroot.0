From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed,  4 Mar 2015 22:01:02 +0100
Subject: [Buildroot] [PATCH] package/libiconv: typo
Message-ID: <1425502862-17966-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/libiconv/libiconv.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index af55b60..f014da0 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -12,7 +12,7 @@ LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Don't build the preloadable library, as we don't need it (it's only
 # for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
-# when glibc is ued). And it causes problems for static only builds.
+# when glibc is used). And it causes problems for static only builds.
 define LIBICONV_DISABLE_PRELOAD
 	$(SED) '/preload/d' $(@D)/Makefile.in
 endef
-- 
1.7.9.5
