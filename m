From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:38:41 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: fix indentation
Message-ID: <20160704093947.7C8D47FD4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c2982bf8c0645407ccd692205c800fbc44319b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use tabs everywhere still we don't have an official policy.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/S60nfs | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 2d4e082..893b1e4 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -17,7 +17,7 @@ CFG_FILE=/etc/default/nfsd
 
 NR_THREADS=2
 if [ -f "${CFG_FILE}" ]; then
-    . "${CFG_FILE}"
+	. "${CFG_FILE}"
 fi
 
 
@@ -66,23 +66,23 @@ stop() {
 
 # See how we were called.
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart)
-	stop
-	start
-	;;
-  reload)
-	/usr/sbin/exportfs -r
-	touch /var/lock/subsys/nfs
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	reload)
+		/usr/sbin/exportfs -r
+		touch /var/lock/subsys/nfs
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit 0
