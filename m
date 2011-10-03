From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:54 +0200
Subject: [Buildroot] [PATCH 18/22] xlib_libXau: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <1317676858-3407-19-git-send-email-arnout@mind.be>
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
index 2404a3e..b86a302 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -11,7 +11,5 @@ XLIB_LIBXAU_AUTORECONF = NO
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.6.3
