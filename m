From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:24:24 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.3.13
Message-ID: <20150302222723.926FB8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=681a90f746e1dfd5c8abde9a9ec6ac31e5bc76cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash |    2 +-
 package/gnutls/gnutls.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 16a6fcb..24da09d 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	67ab3e92c5d48f3323b897d7c1aa0bb2af6f3a84f5bd9931cda163a7ff32299b	gnutls-3.3.12.tar.xz
+sha256	91bf1ef5c159b7f2176f972184545b287af6507ab55a543f6007d31406b97a99	gnutls-3.3.13.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ab176a6..6a6199e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.3
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
