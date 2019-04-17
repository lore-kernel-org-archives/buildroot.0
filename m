From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Apr 2019 19:34:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.70.0
Message-ID: <20190417173450.5559-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.hash | 4 ++--
 package/boost/boost.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index c67c3f4a54..c6cc3c2639 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From http://www.boost.org/users/history/version_1_69_0.html
-sha256 8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406  boost_1_69_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_70_0.html
+sha256 430ae8354789de4fd19ee52f3b1f739e1fba576f0aded0897c3c2bc00fb38778  boost_1_70_0.tar.bz2
 
 # Locally computed
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 432730901a..920a3dd37f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.69.0
+BOOST_VERSION = 1.70.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.20.1
