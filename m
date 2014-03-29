From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:12:19 +0100
Subject: [Buildroot] [git commit] xcb-util-wm: Bump version to 0.4.1
Message-ID: <20140329222158.09EA29C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc527214854fb864263c26ebd7ac81ff153c392f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util-wm/xcb-util-wm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 622f295..b255710 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_WM_VERSION = 0.3.9
+XCB_UTIL_WM_VERSION = 0.4.1
 XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
 XCB_UTIL_WM_INSTALL_STAGING = YES
