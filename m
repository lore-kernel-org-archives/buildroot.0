From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Jan 2015 18:48:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/intel-microcode: bump version to
	20150107, add hash
Message-ID: <1422121699-1922-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added hash (Yann)

 package/intel-microcode/intel-microcode.hash |    2 ++
 package/intel-microcode/intel-microcode.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/intel-microcode/intel-microcode.hash

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
new file mode 100644
index 0000000..e46f7b0
--- /dev/null
+++ b/package/intel-microcode/intel-microcode.hash
@@ -0,0 +1,2 @@
+# Locally computed by Yann (http://lists.busybox.net/pipermail/buildroot/2015-January/117918.html) and me
+sha256	f5e7fb58643b2bf327eedf7bd91780fd5dfe74397552977cc77194c165910255	microcode-20150107.tgz
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
