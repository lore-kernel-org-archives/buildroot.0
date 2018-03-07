From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:38 +0100
Subject: [Buildroot] [PATCH 13/19] package/x11r7/xapp_twm: bump version to
 1.0.10
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 9 +++++++--
 package/x11r7/xapp_twm/xapp_twm.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index eecc5c4e51..572ecb9820 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002565.html
-sha256	c575167ac33edf3bd1592f1bedfe0559debb128ed5fb4873c1278e3be166310a	twm-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002857.html
+md5 e322c08eeb635f924ede5b8eba3db54e  twm-1.0.10.tar.bz2
+sha1 f632a47620dfe6d75b003839d269b14fa22b262e  twm-1.0.10.tar.bz2
+sha256 6449eadca16ce0f0d900605b0cc020b95f40619261b7beccfb46bcc1836445d7  twm-1.0.10.tar.bz2
+sha512 1280683fce7ebbf5670239cb1f3cee2b40612bd9850d98827e793cf8bf298bdb58e48387cab943ea6befc6f7b34da2567353c22b8eaeb8bcf1b9e303cd7e6a9e  twm-1.0.10.tar.bz2
+# Locally computed
+sha256 4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 1f576e15bd..0af30f737c 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.9
+XAPP_TWM_VERSION = 1.0.10
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
-- 
2.11.0
