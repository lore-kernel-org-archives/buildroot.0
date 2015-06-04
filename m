From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 10:39:24 -0300
Subject: [Buildroot] [PATCH 1/2] libgtk2: bump to version 2.24.28
Message-ID: <1433425165-24392-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.hash | 4 ++--
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index c2189f8..21e8eb7 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.27.sha256sum
-sha256	20cb10cae43999732a9af2e9aac4d1adebf2a9c2e1ba147050976abca5cd24f4	gtk+-2.24.27.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.28.sha256sum
+sha256	b2c6441e98bc5232e5f9bba6965075dcf580a8726398f7374d39f90b88ed4656	gtk+-2.24.28.tar.xz
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index fbc0d08..0617b9e 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).27
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).28
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-- 
2.3.6
