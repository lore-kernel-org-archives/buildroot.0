From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 15:03:11 +0200
Subject: [Buildroot] [PATCH] gnutls: bump version to 3.5.12
Message-ID: <20170517130311.27974-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see the release notes:

https://lists.gnupg.org/pipermail/gnutls-devel/2017-May/008427.html
https://lists.gnupg.org/pipermail/gnutls-devel/2017-April/008393.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
This contains a number of bugfixes and some of them with possible security
implications, so it IMHO makes sense to add to master.

 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 64b86d759..8e2469a5b 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	af443e86ba538d4d3e37c4732c00101a492fe4b56a55f4112ff0ab39dbe6579d	gnutls-3.5.10.tar.xz
+sha256	63cb39a5eaa029381df2e49a74cfb7be89fc4a592445191818ffe1e66bde57cb	gnutls-3.5.12.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 47da90fd7..c192469f9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.11.0
