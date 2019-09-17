From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:49:42 +0200
Subject: [Buildroot] [git commit] package/bwm-ng: bump version to 0.6.2
Message-ID: <20190917204505.DF3888EA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a92013c971f070f1e9c65c4c757a64752cb3796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file, and drop 'v' from version for compatibility with
release-monitoring.org.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bwm-ng/bwm-ng.hash | 3 ++-
 package/bwm-ng/bwm-ng.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
index 4c12b0d81a..4b66227676 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  4b34a8ac2eae2d204d6dea8258c5e34b37094259086f8c9169391409a9311fb5  bwm-ng-f54b3fad2c80bfe63f920c9b5e7c1d80389c57ef.tar.gz
+sha256  906a2d561f2ec9e0dd68b7f51b302908e99515ea1216d0ecaf14d873ef54ae70  bwm-ng-0.6.2.tar.gz
+sha256  8556cc15ba3c0a411bf7d94bac5870829fb725f294b450c724c1e0856a601556  COPYING
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 587ffbea5b..5e663dafea 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BWM_NG_VERSION = f54b3fad2c80bfe63f920c9b5e7c1d80389c57ef
-BWM_NG_SITE = $(call github,vgropp,bwm-ng,$(BWM_NG_VERSION))
+BWM_NG_VERSION = 0.6.2
+BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0
 BWM_NG_LICENSE_FILES = COPYING
