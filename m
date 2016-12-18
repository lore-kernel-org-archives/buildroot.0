From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 21:33:02 +0100
Subject: [Buildroot] [git commit] zlib: update homepage link
Message-ID: <20161218203346.994B9818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0ccec38973f825f18c3600900cc771f7d79ecec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index f623304..6201aba 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_ZLIB
 	  Standard (de)compression library. Used by things like
 	  gzip and libpng.
 
-	  http://www.gzip.org/zlib/
+	  http://www.zlib.net
