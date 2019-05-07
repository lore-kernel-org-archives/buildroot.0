From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:37 +0200
Subject: [Buildroot] [PATCH v1 17/28] package/pngquant: replace utf-8 hyphen
 by ascii hyphen
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-17-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pngquant/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pngquant/Config.in b/package/pngquant/Config.in
index c63f0f9d09..5fc93f60a2 100644
--- a/package/pngquant/Config.in
+++ b/package/pngquant/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PNGQUANT
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
 	help
-	  Lossy PNG compressor ? pngquant command and libimagequant
+	  Lossy PNG compressor - pngquant command and libimagequant
 	  library

 	  https://pngquant.org
--
2.21.0
