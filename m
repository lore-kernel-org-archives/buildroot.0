From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 22:40:46 +0200
Subject: [Buildroot] [git commit] libxkbcommon: bump to version 0.6.1
Message-ID: <20160428204526.EACD981ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd2e6d173895196a8a7b45a508dbcedb42f4c4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxkbcommon/libxkbcommon.hash | 5 ++---
 package/libxkbcommon/libxkbcommon.mk   | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 9cbe440..693630a 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,3 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2014-October/017836.html
-md5	2e1faeafcc609c30af3a561a91e84158	libxkbcommon-0.5.0.tar.xz
-sha1	7127993bfb69e13cdff25fb8b3c8f26ce6be5bfa	libxkbcommon-0.5.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-April/027962.html
+sha256	5b0887b080b42169096a61106661f8d35bae783f8b6c58f97ebcd3af83ea8760	libxkbcommon-0.6.1.tar.xz
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 12d5f16..1f80348 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.5.0
+LIBXKBCOMMON_VERSION = 0.6.1
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-LIBXKBCOMMON_LICENSE_FILES = COPYING
-
+LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 # uses C99 features
