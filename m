From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:31:29 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 0.14.1
Message-ID: <20150425083134.DD5707FF6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1060dcfb798e1488b316c65ed5ad7fa2eb4d4455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash |    4 ++--
 package/libinput/libinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a910648..6452847 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-March/020833.html
-sha256	6cecaf7fde525f1d81474cbd495ce526d5e34c845d3e9d6f3e2565b7048cc61a	libinput-0.13.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-April/021485.html
+sha256	2bed202ebe2d5026950d6f9d2ac0f0160d12f61c5a0f6d0d6ef671bbb02c1b64	libinput-0.14.1.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a9723c6..bacee6a 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.13.0
+LIBINPUT_VERSION = 0.14.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
