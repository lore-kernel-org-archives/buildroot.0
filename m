From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:51:53 +0100
Subject: [Buildroot] [git commit] package/bind: update the upstream URL in
 Config.in
Message-ID: <20191125204401.5F1CD8354B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2bbf689bd97938901984c2e03102ec72acdc48f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
