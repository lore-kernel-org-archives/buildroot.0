From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 12:46:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version to
	20170511
Message-ID: <20170605104609.23020-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 7925209b2..8f0a3fc84 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	096e39489eef67666be652e81fa372a06b74f39ea3d565dc0287242c668717e7	microcode-20151106.tgz
+sha256 2f77fd2d87403b754d01a66c78a36a8b8ffc16dc3c50fb7aa2c4cd4da7f681a3  microcode-20170511.tgz
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index aefa99a1c..831e6c094 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20151106
+INTEL_MICROCODE_VERSION = 20170511
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/25512/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/26798/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
-- 
2.11.0
