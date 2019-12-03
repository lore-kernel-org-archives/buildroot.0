From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:48:10 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/copas: update the
 upstream URL in Config.in
Message-ID: <20191203134029.981FB83FEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6e779e225c729c029154969cba16a6064a88277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89409f4073b7fd77d27f66328ad8964583804843)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/copas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/copas/Config.in b/package/copas/Config.in
index 2de1967102..347d86ddfc 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_COPAS
 	  servers. But it also features timers and client support for
 	  http(s), ftp and smtp requests.
 
-	  http://www.keplerproject.org/copas/
+	  http://keplerproject.github.io/copas/
