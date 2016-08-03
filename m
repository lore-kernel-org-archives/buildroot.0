From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  3 Aug 2016 15:38:11 +0200
Subject: [Buildroot] [PATCH] libsigsegv: update web page URL
Message-ID: <1470231491-21154-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The web page has moved.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libsigsegv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 1f41f0ddf302..90c6ba30a1d0 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBSIGSEGV
 	help
 	  Library for handling page faults in user mode.
 
-	  http://libsigsegv.sourceforge.net/
+	  http://www.gnu.org/software/libsigsegv/
 
 comment "libsigsegv needs a glibc toolchain"
 	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.7.4
