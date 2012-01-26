From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:37:55 +0100
Subject: [Buildroot] [git commit] xcb-util: Install xcb-util libraries into
	staging
Message-ID: <20120126220754.E186A90591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a05d31da25a28e8acaae116e923541be012bb0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xcb-util/xcb-util.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
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
