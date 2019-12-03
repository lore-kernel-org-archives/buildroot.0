From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:51:08 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/gqview: update
 the upstream URL in Config.in
Message-ID: <20191203134255.B69AF842DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ed2f2395567866dc5e01096e67267b256b9341d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c56c3b290039f6e2f73831b1b0f516b7a54a25bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqview/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gqview/Config.in b/package/gqview/Config.in
index c1df40cc19..a654dc41fb 100644
--- a/package/gqview/Config.in
+++ b/package/gqview/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_GQVIEW
 	help
 	  GQview is an image viewer for Unix operating systems
 
-	  http://prdownloads.sourceforge.net/gqview
+	  http://gqview.sourceforge.net/
