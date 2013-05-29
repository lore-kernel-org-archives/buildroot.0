From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 15:30:13 +0200
Subject: [Buildroot] [git commit] freescale-imx: bump to 1.1.0
Message-ID: <20130602212109.E6F749A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41a65bf5be0724e8d36832e330a18a01e3845658
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps both imx-lib and firmware-imx to version 1.1.0.

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freescale-imx/freescale-imx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 0d5400b..2553f67 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREESCALE_IMX_VERSION = 12.09.01
+FREESCALE_IMX_VERSION = 1.1.0
 
 # No official download site from freescale, just this mirror
 FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
