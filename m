From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 16 Feb 2018 10:38:10 -0600
Subject: [Buildroot] [PATCH v2 1/2] libqmi: Update to use libqmi 1.20.0
Message-ID: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to use libqmi 1.20.0

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
[v1->v2]:
- N/A as changes are in patch 2/2

---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1c54231..297e1f0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 a0a42c55935e75a630208e2f70840bd4407f56fe1c5258f5b0f6c0aaedf88cec  libqmi-1.18.0.tar.xz
+sha256 21428cd3749c56246565123f707fee51238651a22c60bdc85ebce97388626eb4  libqmi-1.20.0.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 0887564..a7140dc 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.18.0
+LIBQMI_VERSION = 1.20.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
1.9.1
