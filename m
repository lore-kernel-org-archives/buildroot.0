From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:10:20 +0100
Subject: [Buildroot] [git commit] package/ifenslave: update the upstream URL
 in Config.in
Message-ID: <20191126210245.52EF98152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69559f08900981220aa6def883fd1bfbe221c99f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ifenslave/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
index 2203284db0..d28e0f7c29 100644
--- a/package/ifenslave/Config.in
+++ b/package/ifenslave/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_IFENSLAVE
 	help
 	  Configure network interfaces for parallel routing (bonding)
 
-	  http://anonscm.debian.org/cgit/collab-maint/ifenslave.git
+	  https://salsa.debian.org/debian/ifenslave
