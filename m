From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 10:11:33 +0200
Subject: [Buildroot] [git commit] package/libpciaccess: bump version to
	0.13.4
Message-ID: <20150713081425.1F8AF81946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be6e025f5b8885052441887eb48145d6545f5a05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpciaccess/libpciaccess.hash |    4 ++--
 package/libpciaccess/libpciaccess.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 10efd1c..0483c4c 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002528.html
-sha256	6cd76ccae4e06eee47d3ead84a118740e9406e2a9b7adc9b08e92c69ce89c2e3	libpciaccess-0.13.3.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002590.html
+sha256	07f864654561e4ac8629a0ef9c8f07fbc1f8592d1b6c418431593e9ba2cf2fcf	libpciaccess-0.13.4.tar.bz2
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index ade4cc6..ced0786 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.13.3
+LIBPCIACCESS_VERSION = 0.13.4
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
