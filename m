From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 13:50:39 +0200
Subject: [Buildroot] [git commit] libfreefare: add license information
Message-ID: <20140626115219.3BDEA9D0AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=385adb81a3fdd388da684969ad95929b8c00dc36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreefare/libfreefare.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 362cab2..1b90c3b 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -7,6 +7,8 @@
 LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
+LIBFREEFARE_LICENSE = LGPLv3+ with exception
+LIBFREEFARE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # openssl needs zlib even if the libfreefare example itself doesn't
