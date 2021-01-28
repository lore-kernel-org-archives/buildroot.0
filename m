From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 23:15:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/libgpgme: bump to version 1.15.1
In-Reply-To: <20210128221507.49685-1-fontaine.fabrice@gmail.com>
References: <20210128221507.49685-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128221507.49685-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;h=f6c2b0d3c53b3a62ca71a2a85b2d9764cda359c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpgme/libgpgme.hash | 6 +++---
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 6ed6a3625d..35767a27fe 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.13.1.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.15.1.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46  gpgme-1.13.1.tar.bz2
+sha256  eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad  gpgme-1.15.1.tar.bz2
 # Locally calculated
-sha256 ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
+sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 0e6f6906ed..95a419258b 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.13.1
+LIBGPGME_VERSION = 1.15.1
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.29.2
