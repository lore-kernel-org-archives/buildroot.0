From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:30:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/busybox: fix
 S0{1sys, 2k}logd indentation
Message-ID: <20190426130222.D3D6080163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d8197c88fa5536f692691f6c750bea1e026d50c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit dbdd94e103097b2b169495239f4b3a371c40f6e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/S01syslogd | 8 ++++----
 package/busybox/S02klogd   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
index 6e642a678a..15006bc06f 100644
--- a/package/busybox/S01syslogd
+++ b/package/busybox/S01syslogd
@@ -44,12 +44,12 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature.
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
index a4200cfb34..0677e1e5ca 100644
--- a/package/busybox/S02klogd
+++ b/package/busybox/S02klogd
@@ -44,12 +44,12 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature.
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
