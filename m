From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:22:44 +0100
Subject: [Buildroot] [PATCH 02/34] x11r7/xcb-util: bump to 0.3.9
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util/xcb-util.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 5681b72..fcf99ea 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -3,7 +3,7 @@
 # xcb-util
 #
 #############################################################
-XCB_UTIL_VERSION = 0.3.6
+XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_INSTALL_STAGING = YES
-- 
1.7.9.5
