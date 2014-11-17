From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 17 Nov 2014 20:38:50 +0200
Subject: [Buildroot] [PATCH] libgcrypt: link to a more informative homepage
Message-ID: <560438622c9e2d6313ef31c33d56fae1208987e2.1416249530.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgcrypt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index 55d2f170cd36..dd8f270116a7 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBGCRYPT
 	help
 	  LibGCrypt is GNU's basic cryptographic library.
 
-	  ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
+	  http://www.gnu.org/software/libgcrypt/
-- 
2.1.3
