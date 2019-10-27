From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 10:37:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/cppunit: bump version to 1.14.0
Message-ID: <20191027093716.23877-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://cgit.freedesktop.org/libreoffice/cppunit/tree/NEWS

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cppunit/cppunit.hash | 3 ++-
 package/cppunit/cppunit.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
index a097e3256d..871ce1e542 100644
--- a/package/cppunit/cppunit.hash
+++ b/package/cppunit/cppunit.hash
@@ -1,5 +1,6 @@
 # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
-md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
+md5	7ad93022171710a541bfe4bfd8b4a381  cppunit-1.14.0.tar.gz
+sha256	3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780  cppunit-1.14.0.tar.gz
 
 # Locally calculated:
 sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz
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
-- 
2.20.1
