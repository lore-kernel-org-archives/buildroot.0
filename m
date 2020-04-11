From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 11 Apr 2020 15:19:27 -0700
Subject: [Buildroot] [PATCH 2/2] package/gobject-introspection: bump to
 version 2.64.1
In-Reply-To: <20200411221927.954048-1-aduskett@gmail.com>
References: <20200411221927.954048-1-aduskett@gmail.com>
Message-ID: <20200411221927.954048-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gobject-introspection/gobject-introspection.hash | 4 ++--
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index c6923f8599..68bf63e055 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,4 +1,4 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.64/gobject-introspection-1.64.0.sha256sum
-sha256 eac05a63091c81adfdc8ef34820bcc7e7778c5b9e34734d344fc9e69ddf4fc82 gobject-introspection-1.64.0.tar.xz
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.64/gobject-introspection-1.64.1.sha256sum
+sha256 80beae6728c134521926affff9b2e97125749b38d38744dc901f4010ee3e7fa7 gobject-introspection-1.64.1.tar.xz
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING.LGPL
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING.GPL
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 0a395b814c..eefb2c83f7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.64
-GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
-- 
2.25.2
