From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:16:28 -0300
Subject: [Buildroot] [PATCH v2 1/3] libgtk2: bump to version 2.24.27
Message-ID: <1427750190-10801-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.hash | 2 ++
 package/libgtk2/libgtk2.mk   | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 package/libgtk2/libgtk2.hash

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
new file mode 100644
index 0000000..c2189f8
--- /dev/null
+++ b/package/libgtk2/libgtk2.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.27.sha256sum
+sha256	20cb10cae43999732a9af2e9aac4d1adebf2a9c2e1ba147050976abca5cd24f4	gtk+-2.24.27.tar.xz
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index f52dfaf..39c629c 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).18
-
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).27
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-- 
2.0.5
