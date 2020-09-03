From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:54:12 +0200
Subject: [Buildroot] [git commit] package/subversion: bump to version 1.14.0
Message-ID: <20200903184619.1434687A0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=484412b62d938ff75f3437934c112580590acf1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://subversion.apache.org/docs/release-notes/1.14.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/subversion/subversion.hash | 4 ++--
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index f78990cbb3..da0fe91184 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.13.0.tar.bz2.sha512
-sha512  36f390b412bf772bf894efc2aadc247f12ca30ac407e04f664c14411c3519e1bb242d1239f2f44cbcb86eafc7c413efc8eadbfe1d1e75118235a7b7adc6c85b2  subversion-1.13.0.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.0.tar.bz2.sha512
+sha512  af6b706fdc91f7ab292fce9d9de582da306fd11e92767dc852687e71a6a8b65bb867fa70d5afd7f76a46005acb1b3c2d3193e690def48cd26875b3a7851cd13b  subversion-1.14.0.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 010329357c..83a359b966 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.13.0
+SUBVERSION_VERSION = 1.14.0
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
