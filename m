From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Dec 2014 09:31:08 -0300
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.2.21
Message-ID: <1418301068-25433-1-git-send-email-gustavo@zacarias.com.ar>
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
index e0124d3..70130b9 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7967057e78c3ed968e524a07ab262681219b73001ab8e75cbc4f1a506abdb598	gnutls-3.2.20.tar.xz
+sha256	824196254cf9162b9ff841677f292d108ca1efa6cf8ae1c02b9a8682a3d7087f	gnutls-3.2.21.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 06ca265..3cd8e17 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).20
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).21
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.4
