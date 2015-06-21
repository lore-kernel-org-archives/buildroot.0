From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:56:01 +0200
Subject: [Buildroot] [git commit] package/feh: bump to version 2.13.1,
	add hash file
Message-ID: <20150621075606.B5F067FFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5acecf6f864998e23aff252fffd6ec433b41285
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.hash |    2 ++
 package/feh/feh.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
