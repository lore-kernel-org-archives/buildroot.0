From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 May 2021 09:05:35 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/libudfread: bump version to
 1.1.2
Message-ID: <20210513070536.1021065-1-bernd.kuhls@t-online.de>
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
index 14d24b5dbc..332b472d59 100644
--- a/package/libudfread/libudfread.hash
+++ b/package/libudfread/libudfread.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  529ffa189a6b9fbe08c77430bd18201007b9b20b3153ad92ebd5e1cc515e7151  libudfread-1.1.1.tar.bz2
+sha256  cd062016d78902da53a34c4d536479dbb70b2a05116354d46ead4d0c498ed375  libudfread-1.1.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
index 6803a918d0..55d4fb8e47 100644
--- a/package/libudfread/libudfread.mk
+++ b/package/libudfread/libudfread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDFREAD_VERSION = 1.1.1
+LIBUDFREAD_VERSION = 1.1.2
 LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
 LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
 LIBUDFREAD_AUTORECONF = YES
-- 
2.29.2
