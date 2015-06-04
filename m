From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 09:52:03 -0300
Subject: [Buildroot] [PATCH 2/2] libassuan: bump to version 2.2.1
In-Reply-To: <1433422323-23055-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433422323-23055-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433422323-23055-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libassuan/libassuan.hash | 2 +-
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 15a4a82..a019f76 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,2 +1,2 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  56ac91973c2818a91d4f16ed48265a2b5daf45d3  libassuan-2.1.3.tar.bz2
+sha1  c21b86482f6a3624c2b46b91e20f8415f244233a  libassuan-2.2.1.tar.bz2
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index b86f086..3656ea5 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.1.3
+LIBASSUAN_VERSION = 2.2.1
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
-- 
2.3.6
