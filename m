From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Apr 2019 14:27:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix S01syslog-ng
 indentation
Message-ID: <20190416122701.13036-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't mix spaces and tabs, use only tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/syslog-ng/S01syslog-ng | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/syslog-ng/S01syslog-ng b/package/syslog-ng/S01syslog-ng
index 1d74bf8839..2ced6f8b00 100644
--- a/package/syslog-ng/S01syslog-ng
+++ b/package/syslog-ng/S01syslog-ng
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
-- 
2.20.1
