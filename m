From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jun 2018 22:57:06 +0200
Subject: [Buildroot] [PATCH 1/1] libsecret: bump to version 0.18.6
Message-ID: <20180604205706.1633-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsecret/libsecret.hash | 7 +++++--
 package/libsecret/libsecret.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index a637cbecf4..808b1741f3 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.5.sha256sum
-sha256	9ce7bd8dd5831f2786c935d82638ac428fa085057cc6780aba0e39375887ccb3	libsecret-0.18.5.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.6.sha256sum
+sha256	5efbc890ba41a323ffe0599cd260fd12bd8eb62a04aa1bd1b2762575d253d66f	libsecret-0.18.6.tar.xz
+
+# Hash for license file:
+sha256	a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b	COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 111b553f2c..adc7c508df 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.18
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).5
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).6
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-- 
2.14.1
