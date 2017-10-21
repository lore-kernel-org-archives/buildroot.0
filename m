From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:35:52 +0200
Subject: [Buildroot] [git commit] wine: Bump to version 2.0.3
Message-ID: <20171021192831.6694081184@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0629eb8449f1fdbcfc892722fee262a400b9e6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 2b22a4a..7f0a785 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 f71884f539928877f4b415309f582825d3d3c9976104e43d566944c710713c9a wine-2.0.2.tar.xz
+sha256 a811c664f870a3a01449443a93a6fcee41aea2e912e58f72742eb7924962be56 wine-2.0.3.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index b733952..d540886 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 2.0.2
+WINE_VERSION = 2.0.3
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/2.0
 WINE_LICENSE = LGPL-2.1+
