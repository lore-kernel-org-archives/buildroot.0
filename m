From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 May 2015 07:49:30 -0300
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.3.15
Message-ID: <1430736570-7364-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
GNUTLS-SA-2015-2 - Fix for MD5 downgrade in TLS 1.2 signatures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 53cf3fe..3009478 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52	gnutls-3.3.14.tar.xz
+sha256	8961227852911a1974e15bc017ddbcd4779876c867226d199f06648d8b27ba4b	gnutls-3.3.15.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index b99cacb..9ccc23e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).15
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.5
