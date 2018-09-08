From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:11:26 +0200
Subject: [Buildroot] [git commit] libidn: bump to version 1.35
Message-ID: <20180908131043.33389812AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b05c785946d4f2b08841950cf9d1cf66e987f5b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove sha1 (no announcement made on
http://lists.nongnu.org/archive/html/help-libidn/)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn/libidn.hash | 6 ++----
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 0d03342447..f5ba311e90 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,5 @@
-# From http://lists.nongnu.org/archive/html/help-libidn/2018-03/msg00006.html
-sha1	8701e3d01df25431802ce483756ecad698156835	libidn-1.34.tar.gz
-# Calculated based on the hash above
-sha256	3719e2975f2fb28605df3479c380af2cf4ab4e919e1506527e4c7670afff6e3c	libidn-1.34.tar.gz
+# Locally computed:
+sha256	f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e	libidn-1.35.tar.gz
 
 # Hash for license files:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 77733edaa9..601edcb57d 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.34
+LIBIDN_VERSION = 1.35
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
