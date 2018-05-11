From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 May 2018 08:51:53 +0300
Subject: [Buildroot] [PATCH] uhubctl: bump to version 2.0.0
Message-ID: <4f93a6c8fb65b20df67c7d55c204c59300fa0d9c.1526017913.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uhubctl/uhubctl.hash | 3 ++-
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 6afee905bf46..3724f3fbf9b8 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 dfc85571ad86a071bf7a0db7cadf97a870e628777e47176520de6866b4f042b6 uhubctl-047bb1e392efd3e0ea5d5caf351e20761e12cd44.tar.gz
+sha256 4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e uhubctl-v2.0.0.tar.gz
+sha256 3260a6cd23e2677be1fa0815785cd5fa499d363a033f58cc299e12220662d486 LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 74845001baca..3d2adb347e76 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 047bb1e392efd3e0ea5d5caf351e20761e12cd44
+UHUBCTL_VERSION = v2.0.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
-- 
2.17.0
