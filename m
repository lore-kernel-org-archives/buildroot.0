From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Aug 2019 23:07:55 +0200
Subject: [Buildroot] [git commit] package/intel-microcode: security bump
 version to 20190618
Message-ID: <20190827211017.37F6E86D6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e5e44278a06a042a916a0363fec0a16c3998b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/master/releasenote

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index bb474ad2bb..fbf7109f1d 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-20190514a.tar.gz
+sha256 74ec7415988d40fa53686d994cf8cb27accdbd35c5373c4c3afc2e93372ebba5  intel-microcode-20190618.tar.gz
 sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 1279a1d364..74d5b6c5da 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20190514a
+INTEL_MICROCODE_VERSION = 20190618
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
