From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Jun 2020 12:47:47 +0300
Subject: [Buildroot] [PATCH] package/readline: update homepage link
Message-ID: <ddb7980486206b010ed4d7ab6c2f763da0c03a81.1592214467.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old link is dead since 2017.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/readline/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 1cb0672cf154..7021472623c8 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_READLINE
 	  by applications that allow users to edit command lines
 	  as they are typed in.
 
-	  https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
+	  https://tiswww.case.edu/php/chet/readline/rltop.html
-- 
2.27.0
