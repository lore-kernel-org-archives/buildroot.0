From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:17:32 +0200
Subject: [Buildroot] [git commit] package/libmbim: bump to version 1.24.4
Message-ID: <20201004094312.168EE8D696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6357c37a3720db25474f4a191d1ee6b2a6d95981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/libmbim-devel/2020-October/001127.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 5cd1e51ffd..7ce1a2e7ae 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  32198c099987849c5f442d1cbf4b6e43e645cbdbe9cfdc197b19ddd63c6981e4  libmbim-1.24.2.tar.xz
+sha256  dd488ee6176243a6adb27a5872897336272ea7bea33a3ad501ba268e5a58b285  libmbim-1.24.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index f9c1ec9953..05345623bd 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.24.2
+LIBMBIM_VERSION = 1.24.4
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
