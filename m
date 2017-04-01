From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:29:29 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20170401202954.616D0819C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05ca14e982f69bc9f46490c8943d34822e9149b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index d34dbf1..afd6510 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ac3c088654864781f2b2a2797e3a8b03a1b2e86db731c08cb5f296a04069560d  tvheadend-e5f5a4278949afc96e26d6cd50cf968e0e92d7b6.tar.gz
+sha256 e58f5b2fded91fa085961402db26b54d5338c70e5bebdb0f34d55beb4d5551b4  tvheadend-b142383a7cf51180e00ebb1c13205c14d24338dc.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 77843e2..b82ebc9 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = e5f5a4278949afc96e26d6cd50cf968e0e92d7b6
+TVHEADEND_VERSION = b142383a7cf51180e00ebb1c13205c14d24338dc
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
