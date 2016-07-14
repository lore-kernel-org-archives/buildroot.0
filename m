From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:53:28 +0200
Subject: [Buildroot] [git commit] gnutls: security bump to version 3.4.14
Message-ID: <20160714105337.34DE382231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6606dde1d54660501ec82052af054af63332bc82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
GNUTLS-SA-2016-2 - vulnerability that affects certificate verification
when GnuTLS is used in combination with the p11-kit trust module.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 85254d1..e2c5fa1 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fd3386e8e72725980bcd7f40949aa0121dcb7650b5147c6490e794555ed25859	gnutls-3.4.13.tar.xz
+sha256	35deddf2779b76ac11057de38bf380b8066c05de21b94263ad5b6dfa75dfbb23	gnutls-3.4.14.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3cb08d1..429c1b2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 # README says that the core library is under LGPLv2.1+, but a few
