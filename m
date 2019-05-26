From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:26:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/pngquant: replace
 utf-8 hyphen by ascii hyphen
Message-ID: <20190526072357.CE6DC8E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c82133f95ab95554ed148cf888ec280f59440c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4089cc389c3b20a9e226a233aa051a410b69056d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-	  Lossy PNG compressor ??? pngquant command and libimagequant
+	  Lossy PNG compressor - pngquant command and libimagequant
 	  library
 
 	  https://pngquant.org
