From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jul 2020 10:52:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/iprutils: bump to version 2.4.18.1
Message-ID: <20200728085233.2288013-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iprutils/iprutils.hash | 10 +++++-----
 package/iprutils/iprutils.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
index 423943b22d..bcad6e6d01 100644
--- a/package/iprutils/iprutils.hash
+++ b/package/iprutils/iprutils.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/iprdd/files/iprutils%20for%202.6%20kernels/2.4.15/
-md5 e4011051bba7470df3936cbba7dced98  iprutils-2.4.15.1.tar.gz
-sha1 ed6c362ee3c6bd9023ee60d0d1a1ce5543c27c41  iprutils-2.4.15.1.tar.gz
+# From https://sourceforge.net/projects/iprdd/files/iprutils%20for%202.6%20kernels/2.4.18/
+md5  df733f504dd4f96abf3272f679b25311  iprutils-2.4.18.1.tar.gz
+sha1  701a1a9af6890d333904a92f0b01c26b92f821fa  iprutils-2.4.18.1.tar.gz
 # Locally computed:
-sha256 a733e65f8fb19565f2ef5191eaa2a14d816fabed0fc254ab4bbf1a4c7800ebe5  iprutils-2.4.15.1.tar.gz
-sha256 59b4179e61248aff9cd2d6ee4cd1dbbd0ef48836fe2eeee19f4b16459785104a  LICENSE
+sha256  1c26aee3bf95517fcb844f35ff2711a39b46cbfb50619db1d792c93eeee6f43d  iprutils-2.4.18.1.tar.gz
+sha256  59b4179e61248aff9cd2d6ee4cd1dbbd0ef48836fe2eeee19f4b16459785104a  LICENSE
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 1165b3db0f..3fa8223ff6 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION_MAJOR = 2.4.15
+IPRUTILS_VERSION_MAJOR = 2.4.18
 IPRUTILS_VERSION = $(IPRUTILS_VERSION_MAJOR).1
 IPRUTILS_SITE = https://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils zlib
-- 
2.27.0
