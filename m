From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 22:40:53 +0200
Subject: [Buildroot] [git commit] libgcrypt: bump to version 1.6.2
Message-ID: <20140904204104.3C60D9D5F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cedeec325977df5305e9b31eed79f83e6ce485fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 068d464..ed9c959 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.1
+LIBGCRYPT_VERSION = 1.6.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
