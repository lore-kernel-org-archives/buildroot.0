From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:48:14 +0200
Subject: [Buildroot] [git commit branch/next] package/stress-ng: bump to
 version 0.09.58
Message-ID: <20190518194755.BF81D8A35E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9098a044569b34c41eb4444bdc3ec932fd37b704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index fd7ab42224..4356f55849 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3430e007c4d27c5d79ff177a209d81acc7d3242dbf28effb05ecb92b32a8a03f stress-ng-0.09.55.tar.xz
+sha256 ea1ba0e96637d7ecc0d2b08c981c4fcb3e7753ca7d64d76210154440b9a194e6 stress-ng-0.09.58.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 767af79f25..c5adf99ae5 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.09.55
+STRESS_NG_VERSION = 0.09.58
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
