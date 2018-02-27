From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:32 -0600
Subject: [Buildroot] [NEXT 17/26] libgcrypt: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-18-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libgcrypt/libgcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 00e864e..3e92ff3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -12,6 +12,7 @@ LIBGCRYPT_SITE = https://gnupg.org/ftp/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
+LIBGCRYPT_CPE_ID = gnupg:$(LIBGCRYPT_NAME):$(LIBGCRYPT_VERSION)
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
-- 
1.9.1
