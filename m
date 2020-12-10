From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:02:13 +0100
Subject: [Buildroot] [git commit] package/libudfread: bump version to 1.1.1
Message-ID: <20201210204842.D7E9385FCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f606017b9b3095c142d8892bb2f6974cc103a13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libudfread/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
