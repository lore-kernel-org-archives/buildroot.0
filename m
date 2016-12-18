From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Dec 2016 22:15:58 +0200
Subject: [Buildroot] [PATCH] zlib: update homepage link
Message-ID: <9b0c28cf6754c86bdef25c03acc9a6a5944e8f13.1482092158.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/zlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index f62330486b1a..6201aba1422c 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_ZLIB
 	  Standard (de)compression library. Used by things like
 	  gzip and libpng.
 
-	  http://www.gzip.org/zlib/
+	  http://www.zlib.net
-- 
2.11.0
