From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:42 +0100
Subject: [Buildroot] [PATCH 9/9] Fix minor spacing/tabs issues in
	package/*/Config.in
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44544cf117806c427cba1e131a5b99fa7ec4914f.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cramfs/Config.in    |   10 +++++-----
 package/diffutils/Config.in |    2 +-
 package/expat/Config.in     |    2 +-
 package/genext2fs/Config.in |   14 +++++++-------
 package/genromfs/Config.in  |    8 ++++----
 package/i2c-tools/Config.in |   14 +++++++-------
 package/makedevs/Config.in  |    8 ++++----
 7 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index a5c73a8..daf6e6d 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CRAMFS
-       bool "cramfs"
-       help
-         cramfs is a compressed read-only filesystem. This package
-         contains the tools to generate and check a cramfs filesystem.
+	bool "cramfs"
+	help
+	  cramfs is a compressed read-only filesystem. This package
+	  contains the tools to generate and check a cramfs filesystem.
 
-	 http://sourceforge.net/projects/cramfs/
+	  http://sourceforge.net/projects/cramfs/
diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index df3e426..39e412f 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DIFFUTILS
-	bool"diffutils"
+	bool "diffutils"
 	help
 	  GNU diff. Compare files per line.
 
diff --git a/package/expat/Config.in b/package/expat/Config.in
index 3988c90..758fb7d 100644
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_EXPAT
-	bool"expat"
+	bool "expat"
 	help
 	  The Expat XML Parser.
 
diff --git a/package/genext2fs/Config.in b/package/genext2fs/Config.in
index 82992f8..02c12f4 100644
--- a/package/genext2fs/Config.in
+++ b/package/genext2fs/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_GENEXT2FS
-       bool "genext2fs"
-       help
-         genext2fs generates an ext2 filesystem as a normal (non-root)
-	 user.  It does not require you to mount the image file to
-	 copy files on it, nor does it require that you become the
-	 superuser to make device nodes.
+	bool "genext2fs"
+	help
+	  genext2fs generates an ext2 filesystem as a normal (non-root)
+	  user.	 It does not require you to mount the image file to
+	  copy files on it, nor does it require that you become the
+	  superuser to make device nodes.
 
-	 http://genext2fs.sourceforge.net/
+	  http://genext2fs.sourceforge.net/
diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
index 2caf2a4..7390f0a 100644
--- a/package/genromfs/Config.in
+++ b/package/genromfs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GENROMFS
-       bool "genromfs"
-       help
-         Tool to generate a ROMFS filesystem.
+	bool "genromfs"
+	help
+	  Tool to generate a ROMFS filesystem.
 
-	 http://romfs.sourceforge.net/
\ No newline at end of file
+	  http://romfs.sourceforge.net/
\ No newline at end of file
diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 47d0642..6bd38b5 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_I2C_TOOLS
-    bool "i2c-tools"
-    help
-        Heterogeneous set of I2C tools for Linux
+	bool "i2c-tools"
+	help
+	  Heterogeneous set of I2C tools for Linux
 
-        This package contains a heterogeneous set of I2C tools for Linux:
-        a bus probing tool, a chip dumper, register-level access helpers,
-        EEPROM decoding scripts, and more.
+	  This package contains a heterogeneous set of I2C tools for
+	  Linux: a bus probing tool, a chip dumper, register-level
+	  access helpers, EEPROM decoding scripts, and more.
 
-        http://www.lm-sensors.org
+	  http://www.lm-sensors.org
diff --git a/package/makedevs/Config.in b/package/makedevs/Config.in
index 4f8c38d..b530889 100644
--- a/package/makedevs/Config.in
+++ b/package/makedevs/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MAKEDEVS
-       bool "makedevs"
-       help
-         The makedevs utility allows to create a set of device files
-         according to a configuration file.
\ No newline at end of file
+	bool "makedevs"
+	help
+	  The makedevs utility allows to create a set of device files
+	  according to a configuration file.
\ No newline at end of file
-- 
1.7.0.4
