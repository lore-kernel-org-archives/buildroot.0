From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:44:55 +0200
Subject: [Buildroot] [git commit branch/next] package/wayland-protocols:
	bump version to 1.10
Message-ID: <20170823133855.9FA2D81E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a5bf83802ed00d40d867c580e8f8c887b974588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added all hashes provided by upstream.

Upcoming mesa3d 17.2.0 needs version >= 1.8:
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.2&id=02cc359372773800de817950aebdf9be2c7973d1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 ++++--
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index a316698..bfda1d8 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,2 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030606.html
-sha256	635f2a937d318f1fecb97b54074ca211486e38af943868dd0fa82ea38d091c1f	wayland-protocols-1.7.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-July/034706.html
+md5 84a7846c2b6a6a3e265fc9be36453e60  wayland-protocols-1.10.tar.xz
+sha1 4f1322f03fa8b2e6467b8f71471f53eff82728a4  wayland-protocols-1.10.tar.xz
+sha256 5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a  wayland-protocols-1.10.tar.xz
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 54c2ec1..a4b3376 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.7
+WAYLAND_PROTOCOLS_VERSION = 1.10
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
