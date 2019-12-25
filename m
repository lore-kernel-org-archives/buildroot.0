From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:13:33 +0100
Subject: [Buildroot] [git commit] package/boost: bump to version 1.72.0
Message-ID: <20191225220423.3F8A78E572@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7100e5c73bbf2d29ce9fdcfd94bf3fab45d21a88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/boost.hash | 4 ++--
 package/boost/boost.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index b3a6f7ec39..0348f40461 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_71_0.html
-sha256 d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee  boost_1_71_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_72_0.html
+sha256 59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722  boost_1_72_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 3bd1e8d2c7..322429a10c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.71.0
+BOOST_VERSION = 1.72.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
