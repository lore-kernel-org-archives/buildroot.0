From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 15:00:43 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.4.10
Message-ID: <20160303140922.9B9D681983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=726f8f2f40022b1834385e1e270b2a3884827a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 1bccffd..f902e44 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	48594fadba33d450f796ec69526cf2bce6ff9bc3dc90fbd7bf38dc3601f57c3f	gnutls-3.4.9.tar.xz
+sha256	6a32c2b4acbd33ff7eefcbd1357009da04c94c60146ef61320b6c076b1bdf59f	gnutls-3.4.10.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 32f44e6..0f8903f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
