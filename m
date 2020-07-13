From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:28:10 +0200
Subject: [Buildroot] [git commit] package/libnetfilter_queue: bump to
 version 1.0.5
Message-ID: <20200713193042.A459286D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65da2ce77ae8daf46e9871a3e114392301c8271b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetfilter_queue/libnetfilter_queue.hash | 7 +++----
 package/libnetfilter_queue/libnetfilter_queue.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libnetfilter_queue/libnetfilter_queue.hash b/package/libnetfilter_queue/libnetfilter_queue.hash
index 1425d41b31..098205c9de 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.hash
+++ b/package/libnetfilter_queue/libnetfilter_queue.hash
@@ -1,6 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_queue/libnetfilter_queue-1.0.3.tar.bz2.{md5sum,sha1sum}
-md5	700ce0ae4784257ab5abe6fd1802f366	libnetfilter_queue-1.0.3.tar.bz2
-sha1	3d182e3211b633d0a0f8a2b12ef80dc2621f53cb	libnetfilter_queue-1.0.2.tar.bz2
+# From http://netfilter.org/pub/libnetfilter_queue/libnetfilter_queue-1.0.5.tar.bz2.sha256sum
+sha256  f9ff3c11305d6e03d81405957bdc11aea18e0d315c3e3f48da53a24ba251b9f5  libnetfilter_queue-1.0.5.tar.bz2
 
 # Hash for license file:
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_queue/libnetfilter_queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
index 302f9a2575..2bb4dd376d 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.mk
+++ b/package/libnetfilter_queue/libnetfilter_queue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_QUEUE_VERSION = 1.0.3
+LIBNETFILTER_QUEUE_VERSION = 1.0.5
 LIBNETFILTER_QUEUE_SOURCE = libnetfilter_queue-$(LIBNETFILTER_QUEUE_VERSION).tar.bz2
 LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/files
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
