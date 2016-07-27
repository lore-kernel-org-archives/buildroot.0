From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Jul 2016 07:46:23 -0500
Subject: [Buildroot] [PATCH v2 1/2] fmlib: bump to fsl-sdk-v2.0
Message-ID: <1469623584-54185-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/fmlib/fmlib.hash | 2 ++
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/fmlib/fmlib.hash

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
new file mode 100644
index 0000000..3746695
--- /dev/null
+++ b/package/fmlib/fmlib.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa	fmlib-fsl-sdk-v2.0.tar.gz
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 405ee14..42cdc27 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v1.8
+FMLIB_VERSION = fsl-sdk-v2.0
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
 FMLIB_LICENSE = BSD-3c, GPLv2+
 FMLIB_LICENSE_FILES = COPYING
-- 
1.9.1
