From: Martin Creutziger <buildroot@martin.creutziger.net>
Date: Mon, 02 Sep 2013 17:18:48 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx.mk typo corrected
Message-ID: <5224AC58.6050001@martin.creutziger.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a simple typo in package/ti-gfx/ti-gfx.mk, which the following 
patch corrects:

Signed-off-by: Martin Creutziger <buildroot@martin.creutziger.net>
---
Index: package/ti-gfx/ti-gfx.mk
===================================================================
--- package/ti-gfx/ti-gfx.mk	(revision 14043)
+++ package/ti-gfx/ti-gfx.mk	(working copy)
@@ -29,7 +29,7 @@
  TI_GFX_PLATFORM = omap3630
  endif
  ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
-TI_GFX_OMPAES = 6.x
+TI_GFX_OMAPES = 6.x
  TI_GFX_PLATFORM = ti81xx
  endif
  ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
--
