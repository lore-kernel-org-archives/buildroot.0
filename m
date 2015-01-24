From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Jan 2015 17:44:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version to
	20150107
Message-ID: <1422117876-20617-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-microcode/intel-microcode.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 640d6fb..4e8ea90 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20140913
+INTEL_MICROCODE_VERSION = 20150107
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24290/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24616/eng
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
 INTEL_MICROCODE_REDISTRIBUTE = NO
-- 
1.7.10.4
