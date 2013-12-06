From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 15:50:49 +0100
Subject: [Buildroot] [git commit] package: change tarball compression to xz
Message-ID: <20131206145212.8FD399BF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b21e0881c46d78b75f77f63a62864c8e45978d55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.mk |    1 +
 package/radvd/radvd.mk   |    1 +
 package/tar/tar.mk       |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index d60ac06..13313a7 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 NGIRCD_VERSION = 20.3
+NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPLv2+
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 27ce7e7..22ab9f9 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 RADVD_VERSION = 1.9.7
+RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index f748724..369dc9d 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TAR_VERSION = 1.27.1
+TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 TAR_LICENSE = GPLv3+
 TAR_LICENSE_FILES = COPYING
