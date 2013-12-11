From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:24:50 +0100
Subject: [Buildroot] [git commit] libdvdnav: add licensing info
Message-ID: <20131211213615.19C709A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f9e045dc062b3ef962df7954de93f7ff831c80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdnav/libdvdnav.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 9a29d6d..befcd8b 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -11,6 +11,8 @@ LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
+LIBDVDNAV_LICENSE = GPLv2+
+LIBDVDNAV_LICENSE_FILES = COPYING
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
