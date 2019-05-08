From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 09:16:24 +0200
Subject: [Buildroot] [git commit] package/vdr: replace utf-8 space by ascii
 character
Message-ID: <20190508073739.A3DD483B6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1698377f39547c0285b706c909285c99b9ca72d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vdr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index 712364a971..df602f26d6 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_VDR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-	depends on BR2_TOOLCHAIN_USES_GLIBC #??execinfo.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
