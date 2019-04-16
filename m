From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Apr 2019 14:13:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix S01rsyslogd indentation
Message-ID: <20190416121338.10562-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't mix spaces and tabs, only use tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/S01rsyslogd | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rsyslog/S01rsyslogd b/package/rsyslog/S01rsyslogd
index e9922d932d..78421876de 100644
--- a/package/rsyslog/S01rsyslogd
+++ b/package/rsyslog/S01rsyslogd
@@ -41,13 +41,13 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature (does not
 		# reconfigure/restart on SIGHUP, just closes all open files).
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
2.20.1
