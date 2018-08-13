From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 13 Aug 2018 11:58:24 -0700
Subject: [Buildroot] [PATCH 1/1] libunistring: bump to version 0.9.10
Message-ID: <20180813185824.98469-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 8a5da7782d..2e4595b17d 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.9.tar.xz.sig
-sha256	a4d993ecfce16cf503ff7579f5da64619cee66226fb3b998dafb706190d9a833	libunistring-0.9.9.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
+sha256	eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7	libunistring-0.9.10.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
 sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 929b52ebd5..fa51447170 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.9
+LIBUNISTRING_VERSION = 0.9.10
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.18.0
