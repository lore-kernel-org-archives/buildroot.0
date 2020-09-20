From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:05:59 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20200920131304.BF9578CA4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97dcf21fb69d2c25336104044230a978354ed27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 83b61ec5ae..d4dbc40067 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b44a09c6579ee7ce7e4b490bd8b7d6d22daed70ccd6571aad222b8c73ffaeeda  tvheadend-51a4c5bec7b6fc69dab7b8d559f9b1b881f0eb8e.tar.gz
+sha256  28cae1960135f9485907a5bea857963d5625fc374371d12320353f824ce70a06  tvheadend-6b8f014c39703640a1fe8af9c2b7663588ed2b56.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b21ab66c9e..de1de4af86 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 51a4c5bec7b6fc69dab7b8d559f9b1b881f0eb8e
+TVHEADEND_VERSION = 6b8f014c39703640a1fe8af9c2b7663588ed2b56
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
