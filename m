From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 21:00:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/x265: update the
 upstream URL in Config.in
Message-ID: <20191225195133.01A2C8E3F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=137b2233b65e2244f9762c4df744b71ddb8700f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2dc43f8fa96168259da7a26c67da6dc5e72d789c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x265/Config.in b/package/x265/Config.in
index cc39d6c6a9..180931db66 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_X265
 	  General Public License (GPL) 2 license or a commercial
 	  license, similar to the x264 project.
 
-	  http://x265.org
+	  https://bitbucket.org/multicoreware/x265/wiki/Home
 
 if BR2_PACKAGE_X265
 
