From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 23:32:48 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: fix S01syslog-ng
 indentation
Message-ID: <20190417212918.6700A8F005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26c7e2a1a2ee71eb8f2871e642857e5cd1c02ce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't mix spaces and tabs, use only tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
