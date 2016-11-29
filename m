From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Nov 2016 06:41:02 +0200
Subject: [Buildroot] [PATCH] bzip2: update homepage link
Message-ID: <d277112c54174c44b5bae3adefebec4bdf00b255.1480394462.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid a redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bzip2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index e8e03cf08e6c..dbc82496df7e 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_BZIP2
 	  available techniques, while being around twice as fast at
 	  compression and six times faster at decompression.
 
-	  http://sources.redhat.com/bzip2/
+	  http://www.bzip.org
-- 
2.10.2
