From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:28:06 +0100
Subject: [Buildroot] [git commit] package/wayland-protocols: bump version to
 1.12
Message-ID: <20171206212105.B134B81D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd04d59c68217d57928af5c7c44461d3f1b7a302
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland-protocols/wayland-protocols.hash | 9 +++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index bfda1d8..d1d643c 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-July/034706.html
-md5 84a7846c2b6a6a3e265fc9be36453e60  wayland-protocols-1.10.tar.xz
-sha1 4f1322f03fa8b2e6467b8f71471f53eff82728a4  wayland-protocols-1.10.tar.xz
-sha256 5719c51d7354864983171c5083e93a72ac99229e2b460c4bb10513de08839c0a  wayland-protocols-1.10.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-December/036037.html
+md5 ac83c4704003323b6bd5a1b91fb1be53  wayland-protocols-1.12.tar.xz
+sha1 ac908e91c6c5e7802c0af48f55725ad683017e72  wayland-protocols-1.12.tar.xz
+sha256 3b19e8a9e1e19474756a7069db23b90ca9b8ebb438448c6063b4a7fc89b7c8b2  wayland-protocols-1.12.tar.xz
+sha256 f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index a4b3376..0d23e9a 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.10
+WAYLAND_PROTOCOLS_VERSION = 1.12
 WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
