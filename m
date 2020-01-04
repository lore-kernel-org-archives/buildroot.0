From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2020 09:03:36 +0100
Subject: [Buildroot] [git commit] package/libmbim: bump to version 1.20.4
Message-ID: <20200104075445.838E08EA0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=393fc7b5f54c5e2e93cff23f5b07afcd5a248618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Small update with several memory leaks fixed.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 94021c835a..bbf2c63afc 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  550fb69e5e57f7646f8eb9ed8d24e44ea869ad846be9c162893f12e43528059b  libmbim-1.20.2.tar.xz
+sha256  ac2708a409b09f1f6f1786a8a9e39c36619aa8d6f285ea943daa7a48ea36d3e8  libmbim-1.20.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index bd055df372..dc5c9a59de 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.20.2
+LIBMBIM_VERSION = 1.20.4
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
