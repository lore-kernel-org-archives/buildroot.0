From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:24:52 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xlib_libxshmfence: bump version to 1.2
Message-ID: <20150214143822.EB3918044E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86458abafb1c80974dee500508f5cb6a732567dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index f0fb90f..3a2f326 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.1
+XLIB_LIBXSHMFENCE_VERSION = 1.2
 XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.bz2
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
