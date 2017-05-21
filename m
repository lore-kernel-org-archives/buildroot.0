From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 19:12:16 +0200
Subject: [Buildroot] [PATCH/next] package/autoconf-archive: bump version to
	2017.03.21
Message-ID: <20170521171216.432-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch | 6 ++++--
 package/autoconf-archive/autoconf-archive.hash              | 2 +-
 package/autoconf-archive/autoconf-archive.mk                | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
index 6d345d346..c0efeb335 100644
--- a/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
+++ b/package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
@@ -17,6 +17,8 @@ fi
 Remove the [] on the third part of AS_IF.
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+(rebased against version 2017.03.21)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  m4/ax_tls.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -29,8 +31,8 @@ index 809b761..2135dd2 100644
  #   modified version of the Autoconf Macro, you may extend this special
  #   exception to the GPL to apply to your modified version as well.
  
--#serial 11
-+#serial 12
+-#serial 13
++#serial 14
  
  AC_DEFUN([AX_TLS], [
    AC_MSG_CHECKING([for thread local storage (TLS) class])
diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 6982a4dd6..2c537b33a 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 88fb2efff640eddd28a52ae550ff5561bca3bd2bba09e1d7b0580e719875e437  autoconf-archive-2016.03.20.tar.xz
+sha256 386ad455f12bdeb3a7d19280441a5ab77355142349200ff11040a8d9d455d765  autoconf-archive-2017.03.21.tar.xz
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 053ea33fa..6a7ac4da3 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2016.03.20
+AUTOCONF_ARCHIVE_VERSION = 2017.03.21
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.11.0
