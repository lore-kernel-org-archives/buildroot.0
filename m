From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 21:12:36 +0100
Subject: [Buildroot] [git commit] libgcrypt: bump to version 1.7.5
Message-ID: <20161230201946.6145281EC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd469943b9fc73d18c80efe8c5805aed93dc327e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 885f831..89c5719 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2016-08/msg00008.html
-sha1 5a034291e7248592605db448481478e6c963aa9c  libgcrypt-1.7.3.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2016-12/msg00007.html
+sha1 fa485d854748fc06ea041b3057b2de2f12fbc17f  libgcrypt-1.7.5.tar.bz2
 # Calculated based on the hash above
-sha256 ddac6111077d0a1612247587be238c5294dd0ee4d76dc7ba783cc55fb0337071  libgcrypt-1.7.3.tar.bz2
+sha256 d1fea4128beef2bb30a470af6bafabccc503ced350534fb9dd8f5a53ffbae800  libgcrypt-1.7.5.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 31f4d6c..48c62b4 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.3
+LIBGCRYPT_VERSION = 1.7.5
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
