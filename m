From: Will Newton <will.newton@gmail.com>
Date: Thu, 26 Jan 2012 17:42:22 +0000
Subject: [Buildroot] [PATCH 03/14] xcb-util: Install xcb-util libraries into
	staging
Message-ID: <CAFbHwiSaKj5=grPCJgye+5zOVpe+p+9v9i3kxBPir0PuikFViQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/x11r7/xcb-util/xcb-util.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk
b/package/x11r7/xcb-util/xcb-util.mk
index 0158c9f..c43e4cb 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -6,6 +6,7 @@
 XCB_UTIL_VERSION = 0.3.6
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf

 $(eval $(call AUTOTARGETS))
-- 
1.7.1
