From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:23:57 +0200
Subject: [Buildroot] [git commit] package/bcm2835: bump to version 1.60
Message-ID: <20190920211952.E85AD8ED59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=414fb481429bbf22227130482a7e4c9171c15fa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bcm2835/bcm2835.hash | 3 ++-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 1aea3ae3dd..3926d63bb0 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 295f66dab533592ce41db8e07befe985645a2e661bbf75dce9c383e61e24cb5f bcm2835-1.48.tar.gz
+sha256 333e7ceee895e910c29098074773ee86bcab4a82c2af0cf083c4533767e52d27 bcm2835-1.60.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index e24c819cae..82238ee528 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.48
+BCM2835_VERSION = 1.60
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-2.0
 BCM2835_LICENSE_FILES = COPYING
