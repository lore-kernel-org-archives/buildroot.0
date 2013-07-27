From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:07:04 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.3.8
Message-ID: <20130727130650.3254F9AC91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84779fd22a9b7cb76689b6453cee4b8b05a03b5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../squid/squid-01-assume-get-certificate-ok.patch |   12 ++++++------
 package/squid/squid.mk                             |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/squid/squid-01-assume-get-certificate-ok.patch b/package/squid/squid-01-assume-get-certificate-ok.patch
index e7d4515..0f8d93e 100644
--- a/package/squid/squid-01-assume-get-certificate-ok.patch
+++ b/package/squid/squid-01-assume-get-certificate-ok.patch
@@ -3,14 +3,14 @@ Just assume it works ok since we're using a modern OpenSSL version.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura squid-3.3.5.orig/configure.ac squid-3.3.5/configure.ac
---- squid-3.3.5.orig/configure.ac	2013-06-03 09:37:44.016398185 -0300
-+++ squid-3.3.5/configure.ac	2013-06-03 09:37:55.926784556 -0300
-@@ -1261,7 +1261,6 @@
+diff -Nura squid-3.3.8.orig/configure.ac squid-3.3.8/configure.ac
+--- squid-3.3.8.orig/configure.ac	2013-07-26 08:57:50.177259534 -0300
++++ squid-3.3.8/configure.ac	2013-07-26 08:57:55.997448040 -0300
+@@ -1265,7 +1265,6 @@
  AC_SUBST(SSLLIB)
-
+ 
  if test "x$with_openssl" = "xyes"; then
 -SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
+ SQUID_CHECK_OPENSSL_CONST_SSL_METHOD
  SQUID_CHECK_OPENSSL_TXTDB
  fi
-
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f6be405..f7d3987 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 3.3.6
+SQUID_VERSION = 3.3.8
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
