From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:57:49 +0200
Subject: [Buildroot] [git commit] gnutls: security bump to version 3.3.14
Message-ID: <20150330155754.AC3E781810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=552399dbf6526b447799f6873fa9948d11561fe0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a two-byte stack overflow in DTLS 0.9 protocol (no CVE assigned
yet).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.hash |    2 +-
 package/gnutls/gnutls.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 24da09d..53cf3fe 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	91bf1ef5c159b7f2176f972184545b287af6507ab55a543f6007d31406b97a99	gnutls-3.3.13.tar.xz
+sha256	0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52	gnutls-3.3.14.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0154b4d..0aee991 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
