From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 22:43:57 +0200
Subject: [Buildroot] [git commit] package/intel-microcode: bump to version
	20170707
Message-ID: <20171007210422.4FA03801B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7896af3f941f27c91419f5374b597d71287a5832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 8f0a3fc..5ccfd51 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2f77fd2d87403b754d01a66c78a36a8b8ffc16dc3c50fb7aa2c4cd4da7f681a3  microcode-20170511.tgz
+sha256 4fd44769bf52a7ac11e90651a307aa6e56ca6e1a814e50d750ba8207973bee93  microcode-20170707.tgz
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 831e6c0..7ad3bba 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20170511
+INTEL_MICROCODE_VERSION = 20170707
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/26798/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/26925/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
