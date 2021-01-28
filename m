From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Jan 2021 16:44:23 +0200
Subject: [Buildroot] [PATCH] package/stress-ng: bump to version 0.12.02
Message-ID: <70901dcc16ff80850079dc7e0a07af02e5022b03.1611845063.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use https for download to save redirect.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 5250a224752d..41e280191574 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  860291dd3a18b985b3483190a627bbede2b5c52113766c1921001b3fb4b83af0  stress-ng-0.11.17.tar.xz
+sha256  f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5  stress-ng-0.12.02.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 4afdb0a329c6..c26206cd2ef0 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.11.17
+STRESS_NG_VERSION = 0.12.02
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
-STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
+STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-- 
2.29.2
