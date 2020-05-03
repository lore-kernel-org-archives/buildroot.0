From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 May 2020 11:01:10 +0200
Subject: [Buildroot] [PATCH 2/3] package/atk: bump to version 2.36.0
In-Reply-To: <20200503090111.331775-1-fontaine.fabrice@gmail.com>
References: <20200503090111.331775-1-fontaine.fabrice@gmail.com>
Message-ID: <20200503090111.331775-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atk/atk.hash | 6 +++---
 package/atk/atk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 8c1bad5b1a..2e7c3b5fec 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.33/atk-2.33.3.sha256sum
-sha256 532d1081e87b9f0a8d71733101e791818442fa1896531621d1aecc189e1a4ffe atk-2.33.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.36/atk-2.36.0.sha256sum
+sha256  fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788  atk-2.36.0.tar.xz
 
 # Hash for license file
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index a16143d2c0..dfeb4de8b2 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.33
-ATK_VERSION = $(ATK_VERSION_MAJOR).3
+ATK_VERSION_MAJOR = 2.36
+ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
-- 
2.26.2
