From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:45 +0100
Subject: [Buildroot] [PATCH resend 11/22] xlib_libXdmcp: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-12-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 6f513cf..5308206 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,7 +10,5 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.8.3
