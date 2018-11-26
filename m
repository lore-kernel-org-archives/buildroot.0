From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:18:39 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] vtun: remove reference to
 start-stop-daemon from package help
Message-ID: <20181126161527.6201088701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5edb7ab4e4c51229719650a705d6d23b17f0cdd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

None of the other 82 packages that use start-stop-daemon does this.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 11d96cdeb9d59e81973c49fb713fb5982f196110)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
