From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:09:13 +0200
Subject: [Buildroot] [git commit] xapp_xinit: add license information
Message-ID: <20140626151144.73D359D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=890b362bc400e34d3b67ad8a56106f1d2d946fe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xinit/xapp_xinit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 77d3dd4..76197e5 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -8,5 +8,7 @@ XAPP_XINIT_VERSION = 1.3.3
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
+XAPP_XINIT_LICENSE = MIT
+XAPP_XINIT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
