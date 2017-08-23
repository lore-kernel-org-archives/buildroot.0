From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:44:56 +0200
Subject: [Buildroot] [git commit branch/next] package/wayland: bump version
	to 1.14.0
Message-ID: <20170823133855.BAF827F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9f58bd4da216d2f9af40a0b053cb902dc73243a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.hash | 7 +++++--
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 9b2c01d..c46aca2 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033193.html
-sha256  69b052c031a61e89af7cc8780893d0da1e301492352aa449dee9345043e6fe51	wayland-1.13.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-August/034748.html
+md5  0235f6075c32c3be61cff94fa0b9f108  wayland-1.14.0.tar.xz
+sha1 53a443be3bafe73209bbc49ef2cb134ed16e0141  wayland-1.14.0.tar.xz
+sha256 ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8  wayland-1.14.0.tar.xz
+sha512 bd38b2b8963d4d98d42c270e5d7dbff6323789a173b19b67a18258424fd8adee5021b282c9d7f6dad0bd25aa0160e76aecd8ed803d4eb25d911ef0a81cd713a5  wayland-1.14.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index bd1030e..10710a8 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.13.0
+WAYLAND_VERSION = 1.14.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
