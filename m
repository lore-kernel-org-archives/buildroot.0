From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:50:11 +0200
Subject: [Buildroot] [git commit] busybox: fix usage string in S01logging
Message-ID: <20180605164929.60BA7810E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7963858ed64bfc1b0b257c41e0058b684810632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In busybox fix the S01logging usage text to
document the "reload" target.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S01logging | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index 4632a4cc99..fcb3e7d236 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -33,7 +33,7 @@ case "$1" in
 	start
 	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart|reload}"
 	exit 1
 esac
 
