From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:56:33 +0100
Subject: [Buildroot] [git commit] package/rng-tools: bump version to 6.9
Message-ID: <20200211225139.4FDD08DB84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42393bae96460133051cc9261e09780e202d629c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes high rngd startup latency along with other minor bugs:
https://github.com/nhorman/rng-tools/releases/tag/v6.9

Signed-off-by: Wesley Chow <wes.chow@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rng-tools/rng-tools.hash | 4 ++--
 package/rng-tools/rng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 5989d9f022..b5194523eb 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	93e548d4aaf2a1897d4b677f41d8473db1c7f57648adeca18cafa1907e410bb3  rng-tools-6.8.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  a57a7f51a2e3c0faa8afb979709a4c0cbea36d0b52fd835b104f8fb4fd1fa610  rng-tools-6.9.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 274079044c..5338e95590 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.8
+RNG_TOOLS_VERSION = 6.9
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
