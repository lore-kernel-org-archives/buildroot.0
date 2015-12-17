From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:55:45 +0100
Subject: [Buildroot] [git commit] bcache-tools: bump version to 1.0.8
Message-ID: <20151217115520.E87F282523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c142fc6f66f8e61e289007081e01cc9db4b3ac4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also add a hash file.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bcache-tools/bcache-tools.hash | 2 ++
 package/bcache-tools/bcache-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/bcache-tools/bcache-tools.hash b/package/bcache-tools/bcache-tools.hash
new file mode 100644
index 0000000..6d3502f
--- /dev/null
+++ b/package/bcache-tools/bcache-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-v1.0.8.tar.gz
diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
index 666a02f..09604f6 100644
--- a/package/bcache-tools/bcache-tools.mk
+++ b/package/bcache-tools/bcache-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCACHE_TOOLS_VERSION = v1.0.7
+BCACHE_TOOLS_VERSION = v1.0.8
 BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
 BCACHE_TOOLS_LICENSE = GPLv2
 BCACHE_TOOLS_LICENSE_FILES = COPYING
