From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 21 Apr 2020 13:49:28 -0500
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.24.10
Message-ID: <20200421184928.32650-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libqmi/libqmi.hash | 6 +++---
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index ce96721153..197ea1c007 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256	0316badec92ff32f51fe6278e6046968d2272a26608995deedd8e4afb563918a  libqmi-1.24.4.tar.xz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  c2121243b5da8bcffc8f6f5ca0d7217498f94fffd115883763282c68f255fde7  libqmi-1.24.10.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 7e89d4a1ae..cd7fafa42a 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.24.4
+LIBQMI_VERSION = 1.24.10
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.17.1
