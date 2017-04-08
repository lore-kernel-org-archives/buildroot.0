From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:44:25 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20170409074608.86782826EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59e1a13008275cc6879a2e68eb2c696409e3cdea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index afd6510..cfd9c01 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e58f5b2fded91fa085961402db26b54d5338c70e5bebdb0f34d55beb4d5551b4  tvheadend-b142383a7cf51180e00ebb1c13205c14d24338dc.tar.gz
+sha256 94efc13b6c80c204dc4e3cf2ac79632f3c2cafe9cad4ee8948a71be6e4569a16  tvheadend-5cbaac172b4997fbf89667d79ac6e03b46460060.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b82ebc9..c2981ff 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = b142383a7cf51180e00ebb1c13205c14d24338dc
+TVHEADEND_VERSION = 5cbaac172b4997fbf89667d79ac6e03b46460060
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
