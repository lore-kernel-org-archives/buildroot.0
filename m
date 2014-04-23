From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:16:59 +0200
Subject: [Buildroot] [git commit] libdvdnav: bump to version 4.2.1
Message-ID: <20140423221725.ABD6D9C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deb3162c05d5211ee9f2e608bdb6421ae89cb4f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvdnav/libdvdnav.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index befcd8b..78618d3 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 4.1.3
-LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
+LIBDVDNAV_VERSION = 4.2.1
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.xz
 LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
+# configure not shipped
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
