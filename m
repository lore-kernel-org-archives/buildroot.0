From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 May 2016 10:01:37 -0300
Subject: [Buildroot] [PATCH] libksba: security bump to version 1.3.4
Message-ID: <1462885297-9450-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4356 - Fix encoding of invalid utf-8 strings in
dn.c" and "read access out of bounds".

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libksba/libksba.hash | 2 +-
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index f7727f1..92abbab 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0c7f5ffe34d0414f6951d9880a46fcc2985c487f7c36369b9f11ad41131c7786	libksba-1.3.3.tar.bz2
+sha256	f6c2883cebec5608692d8730843d87f237c0964d923bbe7aa89c05f20558ad4f	libksba-1.3.4.tar.bz2
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 7651534..40a8c9b 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.3
+LIBKSBA_VERSION = 1.3.4
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
-- 
2.7.3
