From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 13:45:31 +0100
Subject: [Buildroot] [PATCH 2/3] libgcrypt: bump version to 1.6.4
In-Reply-To: <1441975532-34622-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441975532-34622-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1441975532-34622-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgcrypt/libgcrypt.hash |    4 ++--
 package/libgcrypt/libgcrypt.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 9cad1c4..e845a51 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000364.html
-sha1	9456e7b64db9df8360a1407a38c8c958da80bbf1	libgcrypt-1.6.3.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00000.html
+sha1 ed52add1ce635deeb2f5c6650e52667debd4ec70  libgcrypt-1.6.4.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 9153fb8..53d1d6c 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.3
+LIBGCRYPT_VERSION = 1.6.4
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
1.7.1
