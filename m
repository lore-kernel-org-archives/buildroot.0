From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:51:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/subversion: bump
 to version 1.14.0
Message-ID: <20210214163455.7E8C080057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6846aa19ff836fd492dc06f1f7a6f92a0531b93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

https://subversion.apache.org/docs/release-notes/1.14.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 484412b62d938ff75f3437934c112580590acf1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
