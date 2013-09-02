From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 17:39:44 +0200
Subject: [Buildroot] [git commit] ti-gfx.mk: correct typo
Message-ID: <20130902154223.79F739B6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ee8047024d7edf4500eda57327d793c3f55bdd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a simple typo in package/ti-gfx/ti-gfx.mk, which the
following patch corrects.

Signed-off-by: Martin Creutziger <buildroot@martin.creutziger.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ti-gfx/ti-gfx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 44a3c1d..a94f00d 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -29,7 +29,7 @@ TI_GFX_OMAPES = 5.x
 TI_GFX_PLATFORM = omap3630
 endif
 ifeq ($(BR2_PACKAGE_TI_GFX_ES6),y)
-TI_GFX_OMPAES = 6.x
+TI_GFX_OMAPES = 6.x
 TI_GFX_PLATFORM = ti81xx
 endif
 ifeq ($(BR2_PACKAGE_TI_GFX_ES8),y)
