From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 00:23:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] sysvinit: adjust help text
Message-ID: <20170905222811.87A1182146@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4dbe2e781c93f425ef82e9c7076f326b90819a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

sysvinit is far from ultimate init implementation these days. Update the
help text to match reality.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e9a2746710eb269cfb29075f3afda58e45627d4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 94f1612..7f27a70 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SYSVINIT
 	depends on BR2_INIT_SYSV
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  /sbin/init - parent of all processes
+	  System V style implementation of /sbin/init, parent of all
+	  processes
 
 	  http://savannah.nongnu.org/projects/sysvinit
