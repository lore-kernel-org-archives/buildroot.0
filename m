From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Nov 2015 11:03:51 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.3.19
Message-ID: <1448287431-25909-1-git-send-email-gustavo@zacarias.com.ar>
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
index 088059b..b33c838 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7a87e7f486d1ada10007356917a412cde6c6114dac018e3569e3aa09e9f29395	gnutls-3.3.18.tar.xz
+sha256	888d8779b48f21959b33d4d9ad0b546e5ec3dea20abf0d9bb03869d56b1f44cf	gnutls-3.3.19.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 9fbdb49..1ac3e4e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).18
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.4.10
