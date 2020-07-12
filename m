From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 22:31:28 +0200
Subject: [Buildroot] [git commit] package/libudfread: bump version to 1.1.0
Message-ID: <20200712202820.B36C98693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67f0603b2cf1706339a28bfb82f96c87e3e2409f
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
index 9a68f62089..71ee60b39a 100644
--- a/package/libudfread/libudfread.hash
+++ b/package/libudfread/libudfread.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c4c5ee6b65be051fb1f2a738f726f2afc8601620e8f013d087769dc13aab6d4c  libudfread-1.0.0.tar.bz2
+sha256  93231b5b2158548481e6a129d27d3fb75518cc44a49ad27a2a229340a49e8c08  libudfread-1.1.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
index 53ee4a578e..1861a15562 100644
--- a/package/libudfread/libudfread.mk
+++ b/package/libudfread/libudfread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDFREAD_VERSION = 1.0.0
+LIBUDFREAD_VERSION = 1.1.0
 LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
 LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
 LIBUDFREAD_AUTORECONF = YES
