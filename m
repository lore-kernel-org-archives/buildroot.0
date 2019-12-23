From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:06:52 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/w_scan: update
 the upstream URL in Config.in
Message-ID: <20191223220036.002408E0CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fc3c719dab0d8464e58a370c5c4de2af2f8c900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
[yann.morin.1998 at free.fr: use offical (de) homepage]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2ca152fb7025a423a73cc45ebf53a3d102de0e28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/w_scan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 01dbbae122..d5471200ad 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_W_SCAN
 	  capable of creating channels.conf files (in different output
 	  formats !) as well as initial tuning data for scan.
 
-	  http://wirbel.htpc-forum.de/w_scan/index_en.html
+	  https://www.gen2vdr.de/wirbel/w_scan/index2.html
