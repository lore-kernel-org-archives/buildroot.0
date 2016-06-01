From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:10:00 +0200
Subject: [Buildroot] [git commit] wayland: bump to version 1.11.0
Message-ID: <20160601161312.EBAA2802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cedca2ec69f40668725018d36f017a1e52c39ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.hash | 4 ++--
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index c9d0721..be1b6b5 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-February/027038.html
-sha256  4bf6e790aa6f50ab3825676282ecd75850ec9c4767af96ecb7127b1f3c3d60dc	wayland-1.10.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029163.html
+sha256  9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0	wayland-1.11.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 215e70a..e219624 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.10.0
+WAYLAND_VERSION = 1.11.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
