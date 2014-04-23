From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:16:51 +0200
Subject: [Buildroot] [git commit] libdvdread: bump to version 4.2.1
Message-ID: <20140423221725.A40E39C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d31e98f8166e1c33c599d56342c442b47d5bfad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop redundant LIBTOOL_PATCH = YES

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvdread/libdvdread.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 35d7548..6658460 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 4.1.3
-LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
+LIBDVDREAD_VERSION = 4.2.1
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
 LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
+# configure not shipped
 LIBDVDREAD_AUTORECONF = YES
-LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
 LIBDVDREAD_LICENSE = GPLv2+
