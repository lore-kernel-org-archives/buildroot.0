From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Mar 2018 23:03:47 +0100
Subject: [Buildroot] [PATCH] intel-microcode: bump to version 20180312
Message-ID: <20180314220347.8221-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 12e1dfbf8f..999b27299d 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 063f1aa3a546cb49323a5e0b516894e4b040007107b8c8ff017aca8a86204130  microcode-20180108.tgz
+sha256 0b381face2df1b0a829dc4fa8fa93f47f39e11b1c9c22ebd44f8614657c1e779  microcode-20180312.tgz
 sha256 6d4deb65ca688d930e188bf93f78430f134097b161e6df4a2ef00728e14965e3  license.txt
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index d6c35b21c7..e3134b6408 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20180108
+INTEL_MICROCODE_VERSION = 20180312
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27431/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27591/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
-- 
2.11.0
