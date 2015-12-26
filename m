From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:04:02 +0100
Subject: [Buildroot] [git commit] package/boost: bump to version 1.60.0
Message-ID: <20151226150415.7640481963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef72f660e49c13ffb555440c6f35e085b79d00d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.hash | 6 +++---
 package/boost/boost.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 356242b..294282a 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.59.0/
-md5	6aa9a5c6a4ca1016edd0ed1178e3cb87	boost_1_59_0.tar.bz2
-sha1	b94de47108b2cdb0f931833a7a9834c2dd3ca46e	boost_1_59_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.60.0/
+md5	65a840e1a0b13a558ff19eeb2c4f0cbe	boost_1_60_0.tar.bz2
+sha1	7f56ab507d3258610391b47fef6b11635861175a	boost_1_60_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 0161d68..15f0b77 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.59.0
+BOOST_VERSION = 1.60.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
