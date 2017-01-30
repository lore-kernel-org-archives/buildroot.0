From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 15:16:34 +0100
Subject: [Buildroot] [git commit] libxkbcommon: bump to version 0.7.1
Message-ID: <20170130143937.855518040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=895501375d3e89fae25383166efd0054302f71a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 2677099..525f9ff 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-November/031544.html
-sha256	09351592312d67b438655f54da5b67853026662c4a57e6be4d225f04a9989798	libxkbcommon-0.7.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032725.html
+sha256	ba59305d2e19e47c27ea065c2e0df96ebac6a3c6e97e28ae5620073b6084e68b	libxkbcommon-0.7.1.tar.xz
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 3a0600b..c39a7c0 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.7.0
+LIBXKBCOMMON_VERSION = 0.7.1
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
