From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:06 +0200
Subject: [Buildroot] [PATCH 37/69] xapp_bdftopcf: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-38-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index ebdcda5756bd..489bbba4be25 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -10,6 +10,7 @@ XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_LICENSE = MIT
 XAPP_BDFTOPCF_LICENSE_FILES = COPYING
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
+HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
 
 # needed for linking against libXfont
 XAPP_BDFTOPCF_MAKE_OPTS += LIBS=-ldl
-- 
2.1.0
