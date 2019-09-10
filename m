From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  9 Sep 2019 22:07:09 -0500
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.22.6
Message-ID: <20190910030709.41190-1-matthew.weber@rockwellcollins.com>
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
index 7d622cb702..ca3c747739 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 4c5b8e7bde4144ad875e9efaccd05bcc9b830c9a114df63aa2be8eb5d3caf9f1  libqmi-1.22.4.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256	755bbea2a330ac16d56678fbcdd09201ddb14779059ecc895edfac388551d5de  libqmi-1.22.6.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 302e938c62..78e7b4bea9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.22.4
+LIBQMI_VERSION = 1.22.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.17.1
