From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:33:00 +0200
Subject: [Buildroot] [git commit] liboauth: bump to version 1.0.3
Message-ID: <20140629083648.E580B9D090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=367dcacca54f89fa3348b317003cacb185fe9778
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license information as well.
It could be "or GPL" as well but since we link to openssl that's a murky path
as stated in the README so just leave it at MIT.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liboauth/liboauth.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 6ade856..d247068 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBOAUTH_VERSION = 0.9.6
+LIBOAUTH_VERSION = 1.0.3
 LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
 LIBOAUTH_INSTALL_STAGING = YES
-
 LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
+LIBOAUTH_LICENSE = MIT
+LIBOAUTH_LICENSE_FILES = COPYING.MIT
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOAUTH_DEPENDENCIES += libcurl
