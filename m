From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:49:20 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fastd: update the
 upstream URL in Config.in
Message-ID: <20191203134126.6BFFC84294@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=804cc0c1de21aaf741f0b39752ac60fff9c85e57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Acked-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c468a7580f62ca951f4522de8ffa152c92920783)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fastd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 47c76b5ad6..5ef6de8d78 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_FASTD
 	help
 	  Fast and Secure Tunneling Daemon
 
-	  https://projects.universe-factory.net/projects/fastd/wiki
+	  https://github.com/NeoRaider/fastd/wiki
 
 if BR2_PACKAGE_FASTD
 
