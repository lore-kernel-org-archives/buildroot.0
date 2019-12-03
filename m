From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:12:04 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/bind: update the
 upstream URL in Config.in
Message-ID: <20191203130351.458B483FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed821de10fbbf1c6ed99c61b1b86ba715ec239b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e2bbf689bd97938901984c2e03102ec72acdc48f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 6d4ee2e6d7..db10ceb304 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_BIND
 	  intended to be linked with applications requiring name
 	  service.
 
-	  http://www.isc.org/sw/bind/
+	  https://www.isc.org/bind/
 
 if BR2_PACKAGE_BIND
 
