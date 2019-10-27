From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 12:05:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cppunit: bump version to 1.14.0
Message-ID: <20191027110521.22712-1-bernd.kuhls@t-online.de>
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
v2: fixed sha512 hash and added license hash (Thomas)

 package/cppunit/cppunit.hash | 6 ++++--
 package/cppunit/cppunit.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
index a097e3256d..c8084999ef 100644
--- a/package/cppunit/cppunit.hash
+++ b/package/cppunit/cppunit.hash
@@ -1,5 +1,7 @@
 # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
-md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
+md5	7ad93022171710a541bfe4bfd8b4a381  cppunit-1.14.0.tar.gz
+sha256	3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780  cppunit-1.14.0.tar.gz
 
 # Locally calculated:
-sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz
+sha512	4ea1da423c6f7ab37e4144689f593396829ce74d43872d6b10709c1ad5fbda4ee945842f7e9803592520ef81ac713e95a3fe130295bf048cd32a605d1959882e  cppunit-1.14.0.tar.gz
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
-- 
2.20.1
