From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 00:07:54 +0100
Subject: [Buildroot] [git commit] libksba: security bump to version 1.3.2
Message-ID: <20141125230818.EBAA97FF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42d40e2ea0ad50661aebbc60304b2c935d3edc28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a buffer overflow in ksba_oid_to_str.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libksba/libksba.hash |    4 ++--
 package/libksba/libksba.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index c7d209a..3bd6ef0 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	bc96b95516bd2b67f413bc8b5cc5a75a2583c6e666d24dfd0d5bcc6b1aab46f9	libksba-1.3.1.tar.bz2
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2014q4/000359.html
+sha1	37d0893a587354af2b6e49f6ae701ca84f52da67	libksba-1.3.2.tar.bz2
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index aaf9b62..b48cac5 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.1
+LIBKSBA_VERSION = 1.3.2
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
