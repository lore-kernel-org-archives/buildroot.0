From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 15 Jul 2016 11:08:43 +0100
Subject: [Buildroot] [PATCH 3/3] libassuan: bump version to 2.4.3
In-Reply-To: <1468577323-2248-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468577323-2248-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1468577323-2248-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libassuan/libassuan.hash | 2 +-
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index a019f76..01ade11 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,2 +1,2 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  c21b86482f6a3624c2b46b91e20f8415f244233a  libassuan-2.2.1.tar.bz2
+sha1 27391cf4a820b5350ea789c30661830c9a271518  libassuan-2.4.3.tar.bz2
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 3656ea5..c4d2e4f 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.2.1
+LIBASSUAN_VERSION = 2.4.3
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
-- 
2.7.3
