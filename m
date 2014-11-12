From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Nov 2014 20:58:37 +0100
Subject: [Buildroot] [PATCH v4 9/9] autobuild-run: extend TODO list
In-Reply-To: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1415822317-22500-10-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Some misc. additions to the autobuild-run TODO list.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7fe0b00..a73ccc9 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -47,6 +47,17 @@
 # - Instead of excluding all configurations that have
 #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
 #   necessary host machine requirements are there to build classpath.
+# - Integrate method check-requirements with the SysInfo class, distinghuishing
+#   between required and optional dependencies.
+# - Extend required dependencies to subversion, mercurial, cpio, wget, python,
+#   etc.
+# - Detect selection of multiple virtual package providers and don't consider it
+#   a failure
+# - Properly handle kill of main script: stop all running children and do not
+#   print out stacktraces
+# - Fix problem in removal of output directory: sometimes this fails with
+#   message 'directory not empty' which suggests that someone is writing to the
+#   directory at the time of removal.
 
 """autobuild-run - run Buildroot autobuilder
 
-- 
1.8.5.1
