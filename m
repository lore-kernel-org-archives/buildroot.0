From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Jun 2020 20:01:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_twm: bump version to
 1.0.11
Message-ID: <20200615180127.971073-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow upstream-switch to .xz tarball, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 10 ++++------
 package/x11r7/xapp_twm/xapp_twm.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index 572ecb9820..26661f1fbd 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002857.html
-md5 e322c08eeb635f924ede5b8eba3db54e  twm-1.0.10.tar.bz2
-sha1 f632a47620dfe6d75b003839d269b14fa22b262e  twm-1.0.10.tar.bz2
-sha256 6449eadca16ce0f0d900605b0cc020b95f40619261b7beccfb46bcc1836445d7  twm-1.0.10.tar.bz2
-sha512 1280683fce7ebbf5670239cb1f3cee2b40612bd9850d98827e793cf8bf298bdb58e48387cab943ea6befc6f7b34da2567353c22b8eaeb8bcf1b9e303cd7e6a9e  twm-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-June/003047.html
+sha256  f4e8a842dec410e79741f25ed4dfac09df080835d0bba2e3983b5914569b68c7  twm-1.0.11.tar.xz
+sha512  948034bba23e6b6c4412fcd2e46bb11a9980297601218a54a5055165ab0229a44dde0d50f338b24e82d76f390597e2fa09d11ff7f3fe1b1d736b10083c7da20d  twm-1.0.11.tar.xz
 # Locally computed
-sha256 4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
+sha256  4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 0af30f737c..46d4ca331d 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.10
-XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
+XAPP_TWM_VERSION = 1.0.11
+XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.xz
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
 XAPP_TWM_LICENSE_FILES = COPYING
-- 
2.26.2
