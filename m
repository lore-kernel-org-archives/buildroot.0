From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:51:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fswebcam: update
 the upstream URL in Config.in
Message-ID: <20191203134310.CD3A6842EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3167d9432a32642357b43d2885dbbd4de134f14c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44a2e4c2935a3c842ef8f569ced35090050945b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fswebcam/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index d268454aae..fbd077bc37 100644
--- a/package/fswebcam/Config.in
+++ b/package/fswebcam/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_FSWEBCAM
 	  stdio where it can be piped to something like ncftpput or
 	  scp.
 
-	  http://www.firestorm.cx/fswebcam/
+	  https://www.sanslogic.co.uk/fswebcam/
 
 comment "fswebcam needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
