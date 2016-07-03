From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:07:18 +0200
Subject: [Buildroot] [git commit] libcroco: add explicit dependencies for
	host variant
Message-ID: <20160703071146.691DD7FFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16ef6473ce5130d8f40ede2b2320f50fd27af17a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcroco/libcroco.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index c4cb676..39dd527 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -10,6 +10,7 @@ LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSI
 LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
 LIBCROCO_INSTALL_STAGING = YES
 LIBCROCO_DEPENDENCIES = host-pkgconf libglib2 libxml2
+HOST_LIBCROCO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2
 LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
 # NEWS states that it's only LGPL
 # Source code says v2.1+ even though COPYING.LIB is v2
