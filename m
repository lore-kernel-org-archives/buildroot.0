From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Mar 2017 20:54:56 +0100
Subject: [Buildroot] [PATCH 4/4] package/{mesa3d,
	mesa3d-headers}: bump version to 17.0.1
In-Reply-To: <20170304195456.9726-1-bernd.kuhls@t-online.de>
References: <20170304195456.9726-1-bernd.kuhls@t-online.de>
Message-ID: <20170304195456.9726-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE according to URL mentioned in upstream release note.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 4 ++--
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 35b242ea9..b55554964 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,9 +12,9 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.0
+MESA3D_HEADERS_VERSION = 17.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
-MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
+MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
 MESA3D_HEADERS_LICENSE_FILES = docs/license.html
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 09d3ef8e7..e50b648fc 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2017-February/144115.html
-sha256 39db3d59700159add7f977307d12a7dfe016363e760ad82280ac4168ea668481  mesa-17.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-March/000305.html
+sha256 96fd70ef5f31d276a17e424e7e1bb79447ccbbe822b56844213ef932e7ad1b0c  mesa-17.0.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e17486879..d29a04349 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.0
+MESA3D_VERSION = 17.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
-MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 MESA3D_AUTORECONF = YES
-- 
2.11.0
