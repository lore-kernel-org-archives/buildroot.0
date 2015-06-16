From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 15:23:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/feh: bump to version 2.13.1,
	add hash file
Message-ID: <1434461034-14880-1-git-send-email-vorel@jablocom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.hash | 2 ++
 package/feh/feh.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/feh/feh.hash

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
new file mode 100644
index 0000000..2ba2b01
--- /dev/null
+++ b/package/feh/feh.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  865088d0481f6862d79d7c08d7b6cf1d25058a74a5784e511a1422fea8aba980  feh-2.13.1.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 0c4c164..1fcec20 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.12.1
+FEH_VERSION = 2.13.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.8.0
