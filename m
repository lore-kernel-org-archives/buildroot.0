From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 09:57:20 -0300
Subject: [Buildroot] [PATCH] libgpgme: bump to version 1.5.3
Message-ID: <1418648240-8342-1-git-send-email-gustavo@zacarias.com.ar>
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
index fda2e7d..7ed9b48 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  cb550ea09314a362aa895f1ca92da6ba73fb512a  gpgme-1.5.2.tar.bz2
+sha1  8dd7711a4de117994fe2d45879ef8a9900d50f6a  gpgme-1.5.3.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index fd25532..6377b76 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.2
+LIBGPGME_VERSION = 1.5.3
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
2.0.4
