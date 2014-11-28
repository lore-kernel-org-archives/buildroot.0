From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Nov 2014 16:04:23 +0000
Subject: [Buildroot] [PATCH branch/next] libassuan: bump version to 2.1.3
Message-ID: <1417190663-35264-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.1.3
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libassuan/libassuan.hash |    4 ++--
 package/libassuan/libassuan.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index d875389..15a4a82 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b	libassuan-2.1.2.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  56ac91973c2818a91d4f16ed48265a2b5daf45d3  libassuan-2.1.3.tar.bz2
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 1c2a4f2..b86f086 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.1.2
+LIBASSUAN_VERSION = 2.1.3
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
-- 
1.7.1
