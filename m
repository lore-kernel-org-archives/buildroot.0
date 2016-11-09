From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  9 Nov 2016 18:40:44 +0200
Subject: [Buildroot] [PATCH] libxslt: correct homepage link
Message-ID: <c5785094c23c4455cdfc5b9f1063a98aba25d910.1478709644.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link to the actual webpage of libxslt, not to the xslt spec page.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libxslt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index ee2f66c36ed6..dfe5b99f04c9 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBXSLT
 	  to describe how the document is transformed into another
 	  XML document that uses the formatting vocabulary.
 
-	  http://www.w3.org/TR/xslt
+	  http://xmlsoft.org/xslt/
-- 
2.10.2
