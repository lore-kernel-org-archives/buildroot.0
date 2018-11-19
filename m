From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:24:40 +0100
Subject: [Buildroot] [git commit] vtun: remove reference to
 start-stop-daemon from package help
Message-ID: <20181119212145.576F383B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11d96cdeb9d59e81973c49fb713fb5982f196110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

None of the other 82 packages that use start-stop-daemon does this.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vtun/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index bb8919c3d0..d63e7c76ef 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -10,7 +10,4 @@ config BR2_PACKAGE_VTUN
 
 	  It supports IP, PPP, SLIP, Ethernet and other tunnel types.
 
-	  NOTE: It uses start-stop-daemon in init script, so be sure
-	  to enable that within busybox
-
 	  http://vtun.sourceforge.net/
