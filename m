From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 23:03:17 +0200
Subject: [Buildroot] [git commit] wine: Bump to version 2.0.2
Message-ID: <20170721205910.307D480745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04647c01d524c652a15a9ca95f9fbe307e4174c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 3490c7e..2b22a4a 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 6cfb4eaae566dc7afb7ac0f1f2db2c0d69969952acab0debf084ee8f7b071583 wine-2.0.1.tar.xz
+sha256 f71884f539928877f4b415309f582825d3d3c9976104e43d566944c710713c9a wine-2.0.2.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 68ebd48..b733952 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 2.0.1
+WINE_VERSION = 2.0.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/2.0
 WINE_LICENSE = LGPL-2.1+
