From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:07:23 -0300
Subject: [Buildroot] [PATCH] libgpgme: bump to version 1.7.0
Message-ID: <1476320843-13384-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.hash | 2 +-
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index a7efbf6..9b96fd2 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0b3d3d5107680c594777aae65882a1ff6dd1ba629a83432e719c8b82a743c207	gpgme-1.5.5.tar.bz2
+sha256	71f55fed0f2b3eaf7a606e59772aa645ce3ffff322d361ce359951b3f755cc48	gpgme-1.7.0.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 574ddd6..7e86daf 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.5
+LIBGPGME_VERSION = 1.7.0
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
2.7.3
