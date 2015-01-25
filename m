From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:00:30 +0100
Subject: [Buildroot] [git commit] package/intel-microcode: bump version to
	20150107, add hash
Message-ID: <20150125140040.23C4C8046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f833d5cfbf5a0c3fa306894f9a8ba2c76e1a00be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/intel-microcode/intel-microcode.hash |    2 ++
 package/intel-microcode/intel-microcode.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

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
