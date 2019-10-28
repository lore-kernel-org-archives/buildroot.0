From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 28 Oct 2019 10:26:57 -0700
Subject: [Buildroot] [PATCH 2/3] package/atk: bump to version 2.34.1
In-Reply-To: <20191028172658.923021-1-joseph.kogut@gmail.com>
References: <20191028172658.923021-1-joseph.kogut@gmail.com>
Message-ID: <20191028172658.923021-2-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 8c1bad5b1a..f9127a803a 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.33/atk-2.33.3.sha256sum
-sha256 532d1081e87b9f0a8d71733101e791818442fa1896531621d1aecc189e1a4ffe atk-2.33.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.34/atk-2.34.1.sha256sum
+sha256 d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb atk-2.34.1.tar.xz
 
 # Hash for license file
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 7039666059..99ae186839 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.33
-ATK_VERSION = $(ATK_VERSION_MAJOR).3
+ATK_VERSION_MAJOR = 2.34
+ATK_VERSION = $(ATK_VERSION_MAJOR).1
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
-- 
2.23.0
