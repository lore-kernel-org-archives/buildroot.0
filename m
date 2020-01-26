From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2020 09:06:14 +0100
Subject: [Buildroot] [git commit] package/cppunit: bump to version 1.15.1
Message-ID: <20200126075908.E05EB83B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2d16a56e4ba24965cac6e680810d3abbc65dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppunit/cppunit.hash | 4 ++--
 package/cppunit/cppunit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
index 4948a8b2a1..47577f2a0b 100644
--- a/package/cppunit/cppunit.hash
+++ b/package/cppunit/cppunit.hash
@@ -1,6 +1,6 @@
 # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
-md5	7ad93022171710a541bfe4bfd8b4a381  cppunit-1.14.0.tar.gz
-sha256	3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780  cppunit-1.14.0.tar.gz
+md5	9dc669e6145cadd9674873e24943e6dd  cppunit-1.15.1.tar.gz
+sha256	89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7  cppunit-1.15.1.tar.gz
 
 # Locally calculated:
 sha256	badf14d0aa3eaf1a7ae5f19a47a8ef2fc71a96802c4bc3d354535693c389f4e5  COPYING
diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
index 6d771f331b..3fe12b33bb 100644
--- a/package/cppunit/cppunit.mk
+++ b/package/cppunit/cppunit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPUNIT_VERSION = 1.14.0
+CPPUNIT_VERSION = 1.15.1
 CPPUNIT_SITE = http://dev-www.libreoffice.org/src
 CPPUNIT_INSTALL_STAGING = YES
 CPPUNIT_LICENSE = LGPL-2.1
