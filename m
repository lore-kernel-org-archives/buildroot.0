From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:11:49 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/bind: update the
 upstream URL in Config.in
Message-ID: <20191203130335.CD4C383F96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29a20cdcd97ffb8353ae8cd0450ed09684417dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
index 049a90cbaf..951dd23564 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_BIND
 	  intended to be linked with applications requiring name
 	  service.
 
-	  http://www.isc.org/sw/bind/
+	  https://www.isc.org/bind/
 
 if BR2_PACKAGE_BIND
 
