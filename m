From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:08:42 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/opkg: update the
 upstream URL in Config.in
Message-ID: <20191205210734.17EE58812D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c231d05fa707f5d520f144697dd27a172ef3d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 10a67d886052f9bd5bbf7b459aa2e99bbafa78dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 20f6fa2f53..1f6a39343f 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_OPKG
 	  conforms to a subset of debian's policy manual regarding
 	  control files.
 
-	  http://code.google.com/p/opkg/
+	  https://code.google.com/archive/p/opkg/
 
 if BR2_PACKAGE_OPKG
 
