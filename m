From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:26:06 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/syslog-ng: fix
 S01syslog-ng indentation
Message-ID: <20190426130222.C00AB81470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb9972244ee7b7bd052b4c68e08aac94ab31772b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Don't mix spaces and tabs, use only tabs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 26c7e2a1a2ee71eb8f2871e642857e5cd1c02ce7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
