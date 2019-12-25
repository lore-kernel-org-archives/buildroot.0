From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 21:00:53 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/x265: update the
 upstream URL in Config.in
Message-ID: <20191225195140.D1D468E3FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa85d7fa2c5c22210c183b8fad8b2bafba111050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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
 
