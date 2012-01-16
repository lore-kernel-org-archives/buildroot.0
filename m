From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:48 +0100
Subject: [Buildroot] [PATCH resend 14/22] xlib_libXau: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-15-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libXau/xlib_libXau.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index f7eb3bd..8d67501 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,7 +10,5 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.8.3
