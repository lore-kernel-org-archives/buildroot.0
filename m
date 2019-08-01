From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:26:55 +0200
Subject: [Buildroot] [git commit] package/libassuan: bump to version 2.5.3
Message-ID: <20190801072458.1903488FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f4af887572c8dfd51fec2770ea2055a839217b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash | 6 +++---
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 4878a692cf..bb008d6ed4 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1 fb66bc1e8971d48ac9dbacd1cdaf6487a3e77375  libassuan-2.5.2.tar.bz2
+sha1 6d81bf42fa91ed2894df8b65764ce899e39776f8  libassuan-2.5.3.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.2.tar.bz2.sig
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.3.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7  libassuan-2.5.2.tar.bz2
+sha256 91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702  libassuan-2.5.3.tar.bz2
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 1e4467b36d..034a9bfdfe 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.2
+LIBASSUAN_VERSION = 2.5.3
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
