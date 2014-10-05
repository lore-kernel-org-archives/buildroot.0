From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  5 Oct 2014 08:24:53 +0400
Subject: [Buildroot] [PATCH] package/libdvdnav: fix typo:
	BR2_PREEFER_STATIC_LIB
Message-ID: <1412483093-11686-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/libdvdnav/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index fed3b16..40a375a 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBDVDNAV
 	  http://www.mplayerhq.hu
 
 comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREEFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.8.1.4
