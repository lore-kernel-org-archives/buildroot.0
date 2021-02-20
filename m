From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 18:18:03 +0100
Subject: [Buildroot] [git commit branch/next] package/libxcrypt: also
 install to staging
Message-ID: <20210220165734.767AB81469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63de6a68aaf45aeb395bfcbbcd7c47a1cdb38775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxcrypt/libxcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index f9799ac006..63132edd9d 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -8,6 +8,7 @@ LIBXCRYPT_VERSION = 4.4.17
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
+LIBXCRYPT_INSTALL_STAGING = YES
 LIBXCRYPT_AUTORECONF = YES
 
 $(eval $(autotools-package))
