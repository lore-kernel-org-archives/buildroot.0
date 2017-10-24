From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 08:01:10 +0200
Subject: [Buildroot] [git commit] package/libpciaccess: bump version to 0.14
Message-ID: <20171024055603.2F8397FDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4fc553080e0bc9bf65e60e722089609f0fe232d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpciaccess/libpciaccess.hash | 10 +++++-----
 package/libpciaccess/libpciaccess.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index b060e02..b73c27c 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-April/002791.html
-md5 d810ab17e24c1418dedf7207fb2841d4  libpciaccess-0.13.5.tar.bz2
-sha1 ea98c13623e218359ca6d9af9ab9aa4780201a5b  libpciaccess-0.13.5.tar.bz2
-sha256 752c54e9b3c311b4347cb50aea8566fa48eab274346ea8a06f7f15de3240b999  libpciaccess-0.13.5.tar.bz2
-sha512 4b77aa66b3429fd5f9bff0408b0624305e766bf209f3fa2a0a9024df55bf87ca68f9a5aa34f97ffe131997e0669c65cf542210cf308c0de09842424968c5a159  libpciaccess-0.13.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002817.html
+md5 8f436e151d5106a9cfaa71857a066d33  libpciaccess-0.14.tar.bz2
+sha1 f70a958bf4e744cb4ee93be64e9bc52ac05cdaeb  libpciaccess-0.14.tar.bz2
+sha256 3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4  libpciaccess-0.14.tar.bz2
+sha512 bf40214dfd22f2a223f7c948566e6eaa4bfed60116e71b3eb19f6fe7ab2c4546649eb0416c06d5983e476ea5e27de036936646eb5f800ea97763b6d1f1976f4b  libpciaccess-0.14.tar.bz2
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 1ff2d4a..93b5fc7 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.13.5
+LIBPCIACCESS_VERSION = 0.14
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
