From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 21:47:06 +0200
Subject: [Buildroot] [git commit] package/stress-ng: bump version to 0.10.7
Message-ID: <20191007194927.5694389120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b09f5dd1b3805407a0384a060e61443234c0aad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Madau <maxime.madau@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 4356f55849..a2b9b9ef95 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ea1ba0e96637d7ecc0d2b08c981c4fcb3e7753ca7d64d76210154440b9a194e6 stress-ng-0.09.58.tar.xz
+sha256 85ae86587f605225cc736e1ddba6cc5fd129dfbba0f7d94df755e2e6ac5230e6 stress-ng-0.10.07.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index c5adf99ae5..55e3d297bc 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.09.58
+STRESS_NG_VERSION = 0.10.07
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
