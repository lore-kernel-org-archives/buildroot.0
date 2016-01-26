From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:14:56 +0100
Subject: [Buildroot] [git commit] package/intel-microcode: bump version to
	20151106
Message-ID: <20160201224712.1E30D7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7366974ecf0761b18f07ac5f8f1f6c146543c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index e46f7b0..7925209 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,2 +1,2 @@
-# Locally computed by Yann (http://lists.busybox.net/pipermail/buildroot/2015-January/117918.html) and me
-sha256	f5e7fb58643b2bf327eedf7bd91780fd5dfe74397552977cc77194c165910255	microcode-20150107.tgz
+# Locally computed
+sha256	096e39489eef67666be652e81fa372a06b74f39ea3d565dc0287242c668717e7	microcode-20151106.tgz
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 23c4b3e..aefa99a 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20150107
+INTEL_MICROCODE_VERSION = 20151106
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24616/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/25512/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
