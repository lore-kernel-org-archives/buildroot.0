From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:45:42 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mp4v2: update the
 upstream URL in Config.in
Message-ID: <20191205213859.690F2811CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74f63bcaebf99d7ad852693de1eb58dd82713db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit abd4976515e04ed8d1768dd08ea1d80bcdd4fc51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 42315a2272..490ebac9fd 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MP4V2
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
 
-	  https://code.google.com/p/mp4v2/
+	  https://code.google.com/archive/p/mp4v2/
 
 if BR2_PACKAGE_MP4V2
 
