From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 13:20:12 +0100
Subject: [Buildroot] [PATCH/next 3/5] package/libudfread: bump version to
 1.1.1
In-Reply-To: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
References: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
Message-ID: <20201121122014.1508936-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libudfread/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libudfread/libudfread.hash | 2 +-
 package/libudfread/libudfread.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libudfread/libudfread.hash b/package/libudfread/libudfread.hash
index 71ee60b39a..14d24b5dbc 100644
--- a/package/libudfread/libudfread.hash
+++ b/package/libudfread/libudfread.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  93231b5b2158548481e6a129d27d3fb75518cc44a49ad27a2a229340a49e8c08  libudfread-1.1.0.tar.bz2
+sha256  529ffa189a6b9fbe08c77430bd18201007b9b20b3153ad92ebd5e1cc515e7151  libudfread-1.1.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
index 1861a15562..6803a918d0 100644
--- a/package/libudfread/libudfread.mk
+++ b/package/libudfread/libudfread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDFREAD_VERSION = 1.1.0
+LIBUDFREAD_VERSION = 1.1.1
 LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
 LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
 LIBUDFREAD_AUTORECONF = YES
-- 
2.27.0
