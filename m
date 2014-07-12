From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 11:55:00 +0200
Subject: [Buildroot] [git commit] libgpgme: bump to version 1.5.0
Message-ID: <20140712110213.D93D49D1EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b982cea2fb77107e980ee11d64e45e18ff3a130a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 9995d91..c06d713 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.4.2
+LIBGPGME_VERSION = 1.5.0
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
