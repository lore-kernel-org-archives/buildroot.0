From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 15 May 2019 10:01:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version 0.09.58
Message-ID: <20190515080108.24049-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
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
-- 
2.19.2
