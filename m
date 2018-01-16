From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 19:42:18 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/intel-microcode:
 bump version to 20171117
Message-ID: <20180116194020.9EF9783C30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75e616d4bb89526e30c2d818889e35d848fa28b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6d2d6cbf90c56f28caad8d78bc4ee7b28dc4423b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 3 ++-
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 5ccfd51..0b2aa60 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 4fd44769bf52a7ac11e90651a307aa6e56ca6e1a814e50d750ba8207973bee93  microcode-20170707.tgz
+sha256 93bd1da9fa58ece0016702e657f708b7e496e56da637a3fe9a6d21f1d6f524dc  microcode-20171117.tgz
+sha256 6f905d812453a4775927b2558d51e5ca25a8e0b9bd06841b1b366c722dc0a64f  license.txt
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 7ad3bba..7a88138 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20170707
+INTEL_MICROCODE_VERSION = 20171117
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/26925/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27337/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
