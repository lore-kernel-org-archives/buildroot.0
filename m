From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Jan 2021 22:02:42 +0100
Subject: [Buildroot] [PATCH] package/libsecret: bump to version 0.20.4
Message-ID: <20210104210242.2346-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libsecret/libsecret.hash | 4 ++--
 package/libsecret/libsecret.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index a53cddefa..792ec838e 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.20/libsecret-0.20.3.sha256sum
-sha256  4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4  libsecret-0.20.3.tar.xz
+# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.4.sha256sum
+sha256  325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28  libsecret-0.20.4.tar.xz
 
 # Hash for license file:
 sha256  a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 7526c49c3..4d14c231d 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.20
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).3
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).4
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-- 
2.27.0
