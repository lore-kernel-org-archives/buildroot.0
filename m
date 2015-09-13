From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Sep 2015 09:18:19 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.3.18
Message-ID: <1442146699-10721-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4496a2b..088059b 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b40f158030a92f450a07b20300a3996710ca19800848d9f6fd62493170c5bbb4	gnutls-3.3.17.1.tar.xz
+sha256	7a87e7f486d1ada10007356917a412cde6c6114dac018e3569e3aa09e9f29395	gnutls-3.3.18.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 82d9d29..9fbdb49 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).17.1
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).18
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.4.6
