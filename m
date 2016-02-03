From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Feb 2016 10:42:38 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.4.9
Message-ID: <1454506958-11012-1-git-send-email-gustavo@zacarias.com.ar>
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
index 38418a8..1bccffd 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e07c05dea525c6bf0dd8017fc5b89d886954f04fedf457ecd1ce488ac3b86ab7	gnutls-3.4.8.tar.xz
+sha256	48594fadba33d450f796ec69526cf2bce6ff9bc3dc90fbd7bf38dc3601f57c3f	gnutls-3.4.9.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 78dfa5a..32f44e6 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
-- 
2.4.10
