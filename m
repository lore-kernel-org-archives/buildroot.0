From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:30:07 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 11/11] autobuild-run: extend
	TODO list
In-Reply-To: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413747007-24990-12-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Some misc. additions to the autobuild-run TODO list.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
v2: new patch

 scripts/autobuild-run | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 4803fa1..053b488 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -47,6 +47,14 @@
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
 
 """autobuild-run - run Buildroot autobuilder
 
-- 
1.8.5.1
