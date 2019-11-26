From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:02:57 +0100
Subject: [Buildroot] [git commit] package/fastd: update the upstream URL in
 Config.in
Message-ID: <20191126203656.5D6198120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c468a7580f62ca951f4522de8ffa152c92920783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Acked-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fastd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 1d0b052bd9..c4f296dd63 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FASTD
 	help
 	  Fast and Secure Tunneling Daemon
 
-	  https://projects.universe-factory.net/projects/fastd/wiki
+	  https://github.com/NeoRaider/fastd/wiki
 
 if BR2_PACKAGE_FASTD
 
