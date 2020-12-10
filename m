From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:02:14 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20201210204842.ED9E281019@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baad8071c98ff33439fa0d069c8b02f1abe9ab10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index d4dbc40067..b987a735eb 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28cae1960135f9485907a5bea857963d5625fc374371d12320353f824ce70a06  tvheadend-6b8f014c39703640a1fe8af9c2b7663588ed2b56.tar.gz
+sha256  b5e58601da7af383c2c7f27016417a478be0d302a4a8a00ec87fc8bdacc56ef1  tvheadend-febcf9818d7c37fec8a98d424934edcb3243d5e4.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index de1de4af86..e19763e186 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6b8f014c39703640a1fe8af9c2b7663588ed2b56
+TVHEADEND_VERSION = febcf9818d7c37fec8a98d424934edcb3243d5e4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
