From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:35:39 +0200
Subject: [Buildroot] [git commit branch/next] gnutls: bump to version 3.4.12
Message-ID: <20160522193554.2C01E7FEE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8799db7903ebedaad220a0a60b4209a9e1701b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 450b12b..41e0ccb 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	70ef9c9f95822d363036c6e6b5479750e5b7fc34f50e750c3464a98ec65a9ab8	gnutls-3.4.11.tar.xz
+sha256	e3370a3bf60f2ca4a6204461ea99e7d7047ee46f96bc2fb7c63f103312d3c9c7	gnutls-3.4.12.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 676476d..d19f443 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).11
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
