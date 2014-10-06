From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 17:03:40 -0300
Subject: [Buildroot] [PATCH 1/5] libksba: bump to version 1.3.1
Message-ID: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libksba/libksba.hash | 2 ++
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libksba/libksba.hash

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
new file mode 100644
index 0000000..c7d209a
--- /dev/null
+++ b/package/libksba/libksba.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	bc96b95516bd2b67f413bc8b5cc5a75a2583c6e666d24dfd0d5bcc6b1aab46f9	libksba-1.3.1.tar.bz2
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 086d019..aaf9b62 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.0
+LIBKSBA_VERSION = 1.3.1
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
-- 
2.0.4
