From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Apr 2016 09:14:26 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.4.11
Message-ID: <1460376866-14306-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index f902e44..450b12b 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6a32c2b4acbd33ff7eefcbd1357009da04c94c60146ef61320b6c076b1bdf59f	gnutls-3.4.10.tar.xz
+sha256	70ef9c9f95822d363036c6e6b5479750e5b7fc34f50e750c3464a98ec65a9ab8	gnutls-3.4.11.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0f8903f..676476d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).11
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
-- 
2.7.3
