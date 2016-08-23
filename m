From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:56:32 +0200
Subject: [Buildroot] [git commit branch/next] libksba: bump to version 1.3.5
Message-ID: <20160823155856.679447FFCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a0a0b9af67f3728ee669bf85e2a0ec62a60a184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libksba/libksba.hash | 2 +-
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 92abbab..f0a38f3 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f6c2883cebec5608692d8730843d87f237c0964d923bbe7aa89c05f20558ad4f	libksba-1.3.4.tar.bz2
+sha256	41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340	libksba-1.3.5.tar.bz2
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 40a8c9b..e29b6ae 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.4
+LIBKSBA_VERSION = 1.3.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
