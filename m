From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 21:50:12 +0200
Subject: [Buildroot] [PATCH 1/7] lzip: use the more informative homepage link
Message-ID: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lzip/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzip/Config.in b/package/lzip/Config.in
index f20d0e5daa37..821cd2629288 100644
--- a/package/lzip/Config.in
+++ b/package/lzip/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_LZIP
 	  bzip2, and is better than both from a data recovery perspective.
 	  Lzip is a clean implementation of the LZMA algorithm.
 
-	  http://savannah.nongnu.org/projects/lzip
+	  http://www.nongnu.org/lzip/lzip.html
-- 
2.11.0
