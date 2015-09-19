From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 13:57:12 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20150919115740.3AC6580E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48dbe921829b8c2ac4d60f843b4d9cff14c068da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ec04e6f..db4ee3a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = d9cf931f9f7242f070ae990c4765cbdd5276fd66
+TVHEADEND_VERSION = 7b327910eefa3b89901e86aaec7acc3cd8d15b90
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
