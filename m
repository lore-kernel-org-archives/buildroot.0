From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Jul 2019 21:36:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bummp version to 0.15
Message-ID: <20190712193628.1966-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/libpciaccess.hash | 10 +++++-----
 package/libpciaccess/libpciaccess.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 651f0462b7..36ca2d7e47 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,8 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2017-October/002817.html
-md5 8f436e151d5106a9cfaa71857a066d33  libpciaccess-0.14.tar.bz2
-sha1 f70a958bf4e744cb4ee93be64e9bc52ac05cdaeb  libpciaccess-0.14.tar.bz2
-sha256 3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4  libpciaccess-0.14.tar.bz2
-sha512 bf40214dfd22f2a223f7c948566e6eaa4bfed60116e71b3eb19f6fe7ab2c4546649eb0416c06d5983e476ea5e27de036936646eb5f800ea97763b6d1f1976f4b  libpciaccess-0.14.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003004.html
+md5 843e92d0eef94684a4eb9a2d311bfb12  libpciaccess-0.15.tar.bz2
+sha1 e89fe53622533650203271945759e5e397cdbe10  libpciaccess-0.15.tar.bz2
+sha256 a75643bb5cd02f6da8667d437b76492842dd56bc88e3dfb8410f5d535b99f5dc  libpciaccess-0.15.tar.bz2
+sha512 c34abc438c549db22d27d71d63e13f93cb547eaea238ff2d193627b83a5877e2b34f6fcf4cdaf9b4f0c6b78206447fd9a578454783cfb4e9010e8de20de1364e  libpciaccess-0.15.tar.bz2
 
 # Hash for license file:
 sha256 47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 93b5fc7ac2..5a95ae1338 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.14
+LIBPCIACCESS_VERSION = 0.15
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
2.20.1
