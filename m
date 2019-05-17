From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 May 2019 10:36:40 +0200
Subject: [Buildroot] [git commit] package/dhcp: fix upstream URL in Config.in
Message-ID: <20190517083327.B188B7FEA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d0f35ba2d9799cc1fe4d815904858a38132b63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current URL no longer exists, so update it to what looks like the
main DHCP upstream site.

This issue was noticed by the upstream URL check added by Matt Weber
in the pkg-stats script, whose results are visible at
http://autobuild.buildroot.net/stats/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index a4930e53ba..e626d78a4c 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DHCP
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
-	  http://www.isc.org/products/DHCP
+	  https://www.isc.org/downloads/dhcp/
 
 if BR2_PACKAGE_DHCP
 
