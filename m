From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:45:52 +0100
Subject: [Buildroot] [git commit] package/cppunit: bump version to 1.14.0
Message-ID: <20191027114054.5F28389069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7f2df6d060a1174cce3955ee25d6edea2bf989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://cgit.freedesktop.org/libreoffice/cppunit/tree/NEWS

Added sha256 hash provided by upstream, and therefore drop our locally
calculated sha512 hash. Add hash for the license file as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cppunit/cppunit.hash | 5 +++--
 package/cppunit/cppunit.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
index a097e3256d..4948a8b2a1 100644
--- a/package/cppunit/cppunit.hash
+++ b/package/cppunit/cppunit.hash
@@ -1,5 +1,6 @@
 # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
-md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
+md5	7ad93022171710a541bfe4bfd8b4a381  cppunit-1.14.0.tar.gz
+sha256	3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780  cppunit-1.14.0.tar.gz
 
 # Locally calculated:
-sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz
+sha256	badf14d0aa3eaf1a7ae5f19a47a8ef2fc71a96802c4bc3d354535693c389f4e5  COPYING
diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
index db01b70bec..6d771f331b 100644
--- a/package/cppunit/cppunit.mk
+++ b/package/cppunit/cppunit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPUNIT_VERSION = 1.13.2
+CPPUNIT_VERSION = 1.14.0
 CPPUNIT_SITE = http://dev-www.libreoffice.org/src
 CPPUNIT_INSTALL_STAGING = YES
 CPPUNIT_LICENSE = LGPL-2.1
