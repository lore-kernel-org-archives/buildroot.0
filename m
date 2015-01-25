From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 14:59:57 +0100
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.59,
	add hash
Message-ID: <20150125140001.587018046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2b5e5872126a3cd057bedc883f2e9d0b3f483f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash |    2 ++
 package/libdrm/libdrm.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
new file mode 100644
index 0000000..c893e76
--- /dev/null
+++ b/package/libdrm/libdrm.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/dri-devel/2015-January/075921.html
+sha256	68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b	libdrm-2.4.59.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 28a801f..737a33b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.58
+LIBDRM_VERSION = 2.4.59
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
