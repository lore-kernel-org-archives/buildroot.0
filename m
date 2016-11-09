From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:15:23 +0100
Subject: [Buildroot] [git commit] libxslt: correct homepage link
Message-ID: <20161109201549.544E5819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9a6d70283442f78a965b6c6d9713c4377d90de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to the actual webpage of libxslt, not to the xslt spec page.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index ee2f66c..dfe5b99 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBXSLT
 	  to describe how the document is transformed into another
 	  XML document that uses the formatting vocabulary.
 
-	  http://www.w3.org/TR/xslt
+	  http://xmlsoft.org/xslt/
