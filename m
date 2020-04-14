From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 20:47:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xorgproto: bump version to
 2020.1
Message-ID: <20200414184757.761201-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xorgproto/xorgproto.hash | 10 +++++-----
 package/x11r7/xorgproto/xorgproto.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 17613db009..fda42ac8f6 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,8 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2019-October/003029.html
-md5 a02dcaff48b4141b949ac99dfc344d86  xorgproto-2019.2.tar.bz2
-sha1 2dedbe3e4daccf0c3d675759ed82161a3e4cf1b5  xorgproto-2019.2.tar.bz2
-sha256 46ecd0156c561d41e8aa87ce79340910cdf38373b759e737fcbba5df508e7b8e  xorgproto-2019.2.tar.bz2
-sha512 cbfdf6bb3d58d4d4e7788c9ed779402352715e9899f65594fbc527b3178f1dc5e03cebc8ba5a863b3c196a1a0f2026c2d0438207ca19f81f3c8b7da0c0667904  xorgproto-2019.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-April/003042.html
+md5 c29f4fa78f53b52b3efdc71ebd9506b6  xorgproto-2020.1.tar.bz2
+sha1 1cdab4e9ab796760ddb9582071328469a8eca08a  xorgproto-2020.1.tar.bz2
+sha256 54a153f139035a376c075845dd058049177212da94d7a9707cf9468367b699d2  xorgproto-2020.1.tar.bz2
+sha512 2d10533e54987f293e1c8578aa742c38cf2fac8551db1d317cf5ee4a6a9600eced50f59c57c38b35dd210fe02d350294c967512f04cb9876d6c0c1f7e89cb199  xorgproto-2020.1.tar.bz2
 # Locally computed
 sha256 aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
 sha256 dabc025f93129a0eb2d17f37c719dbe5ecbcb5bc8f7bc7f4ce89fe04576cc0c2  COPYING-bigreqsproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 979286b3c1..1c9f320e51 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2019.2
+XORGPROTO_VERSION = 2020.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.25.0
