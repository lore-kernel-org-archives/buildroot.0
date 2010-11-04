From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 04 Nov 2010 10:58:39 +0200
Subject: [Buildroot] [PATCH 2/2] Bump xinit to 1.2.1
In-Reply-To: <20101104085833.30286.42896.stgit@localhost.localdomain>
References: <20101104085833.30286.42896.stgit@localhost.localdomain>
Message-ID: <20101104085839.30286.70400.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/x11r7/xapp_xinit/xapp_xinit.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 40f68ec..52105c2 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.0.5
+XAPP_XINIT_VERSION = 1.2.1
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINIT_AUTORECONF = NO
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xinit))
