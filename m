From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:53:12 +0200
Subject: [Buildroot] [git commit] genimage: bump to version 6
Message-ID: <20140618220023.3BA7D9D046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dd0c99b12d1cc791c8662a2baba40762bf29d28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index e9ad52e..07d1e0c 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION        = 4
+GENIMAGE_VERSION        = 6
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
 GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
