From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:09:03 +0200
Subject: [Buildroot] [git commit] package/libqmi: bump version to 1.28.6
Message-ID: <20210626124017.7706A812AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a623919d05fdb0263dbc893e802780da3c0c0787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Reviewed-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 2720a8236d..0bfc63f4a4 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  3b14cd2ab5221a7adbb39fed16ef697538ea1c79308821ad2d19b505e1daaea0  libqmi-1.28.4.tar.xz
+sha256  cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd  libqmi-1.28.6.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 278c0116be..35a41e5bd0 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.28.4
+LIBQMI_VERSION = 1.28.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
