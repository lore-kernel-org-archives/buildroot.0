From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:06:24 -0300
Subject: [Buildroot] [PATCH 1/3] sox: bump to version 14.4.2
Message-ID: <1424869586-9033-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sox/sox.hash | 5 +++--
 package/sox/sox.mk   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index 85b1aec..2f8069b 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  9a8c2c6fe51e608da346a157e111508a957af9e3ecf3de26781d36e9a67fa89b  sox-14.4.1.tar.gz
+# From http://sourceforge.net/projects/sox/files/sox/14.4.2/
+md5	ba804bb1ce5c71dd484a102a5b27d0dd	sox-14.4.2.tar.bz2
+sha1	dc9668256b9d81ef25d672f14f12ec026b0b4087	sox-14.4.2.tar.bz2
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 97776fc..ac89691 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SOX_VERSION = 14.4.1
+SOX_VERSION = 14.4.2
 SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
+SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
 SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp
 SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
-- 
2.0.5
