From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:26:00 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/sysklogd: fix
 S0{1sys, 2k}logd indentation
Message-ID: <20190426130222.B65C081470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e264eacdb82ea1ce95fd0188dfb05a81b00209f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Don't mix spaces and tabs, only use tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9064821d0f4ea9ebdb9466d2cb4c791de98a946b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/S01syslogd | 10 +++++-----
 package/sysklogd/S02klogd   | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/sysklogd/S01syslogd b/package/sysklogd/S01syslogd
index d0951f0235..2603632893 100644
--- a/package/sysklogd/S01syslogd
+++ b/package/sysklogd/S01syslogd
@@ -54,9 +54,9 @@ reload() {
 }
 
 case "$1" in
-        start|stop|restart|reload)
-                "$1";;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
diff --git a/package/sysklogd/S02klogd b/package/sysklogd/S02klogd
index 93f39e1f0e..ba728aa99a 100644
--- a/package/sysklogd/S02klogd
+++ b/package/sysklogd/S02klogd
@@ -57,9 +57,9 @@ reload() {
 }
 
 case "$1" in
-        start|stop|restart|reload)
-                "$1";;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
