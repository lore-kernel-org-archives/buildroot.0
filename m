From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:10:35 +0100
Subject: [Buildroot] [git commit] support/testing/tests/download/gitremote:
 remove trailing whitespace
Message-ID: <20190204160959.5AB59837AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dd2f4f3e15333d5c36fcdf242d056c2bd37b939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following flake8 warnings:

support/testing/tests/download/gitremote.py:29:67: W291 trailing whitespace
support/testing/tests/download/gitremote.py:30:60: W291 trailing whitespace

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/download/gitremote.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
index a6e69a1ef1..3b35456dd1 100644
--- a/support/testing/tests/download/gitremote.py
+++ b/support/testing/tests/download/gitremote.py
@@ -26,8 +26,8 @@ class GitRemote(object):
         self.port = None
         self.logfile = infra.open_log_file(builddir, "gitremote", logtofile)
 
-        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose", 
-                      "--listen=localhost", "--export-all", 
+        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose",
+                      "--listen=localhost", "--export-all",
                       "--base-path={}".format(serveddir)]
         for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
             cmd = daemon_cmd + ["--port={port}".format(port=port)]
