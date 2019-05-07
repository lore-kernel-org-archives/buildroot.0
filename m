From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 23:30:29 +0200
Subject: [Buildroot] [PATCH v1 27/28] package/vdr: replace utf-8 space by
 ascii character
In-Reply-To: <20190507213030.1542-1-ps.report@gmx.net>
References: <20190507213030.1542-1-ps.report@gmx.net>
Message-ID: <20190507213030.1542-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	depends on BR2_TOOLCHAIN_USES_GLIBC #?execinfo.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
--
2.21.0
