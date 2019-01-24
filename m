From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 19:49:12 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/libassuan: bump
 to version 2.5.2
Message-ID: <20190124190140.6739886EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a535a6f59300689d9c0490b75db9d244e5dd47f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b905370c098d1266acfae6fa9678ea40953aaa8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash | 7 ++++---
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 2e80cfa4e1..4878a692cf 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,7 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1 c8432695bf1daa914a92f51e911881ed93d50604  libassuan-2.5.1.tar.bz2
+sha1 fb66bc1e8971d48ac9dbacd1cdaf6487a3e77375  libassuan-2.5.2.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.1.tar.bz2.sig
-sha256 47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449  libassuan-2.5.1.tar.bz2
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.2.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256 986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7  libassuan-2.5.2.tar.bz2
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 4dc8f70d1f..1e4467b36d 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.1
+LIBASSUAN_VERSION = 2.5.2
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
