From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Oct 2019 20:04:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xorgproto: bump version to
 2019.2
Message-ID: <20191017180443.20015-1-bernd.kuhls@t-online.de>
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
index e14a9c0363..17613db009 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,8 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/003000.html
-md5 802ccb9e977ba3cf94ba798ddb2898a4  xorgproto-2019.1.tar.bz2
-sha1 f0001f318dff617912b40a9a8ec182de9ffc47b0  xorgproto-2019.1.tar.bz2
-sha256 a6daaa7a6cbc8e374032d83ff7f47d41be98f1e0f4475d66a4da3aa766a0d49b  xorgproto-2019.1.tar.bz2
-sha512 f26c17f4a027acdc799b532fa65c3ea1b0e8c30794c7b7293060ee9d9dec84b4878966cd2dcda43584849232e73a208abd4213374f89b05c10e5aae92bdc00be  xorgproto-2019.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-October/003029.html
+md5 a02dcaff48b4141b949ac99dfc344d86  xorgproto-2019.2.tar.bz2
+sha1 2dedbe3e4daccf0c3d675759ed82161a3e4cf1b5  xorgproto-2019.2.tar.bz2
+sha256 46ecd0156c561d41e8aa87ce79340910cdf38373b759e737fcbba5df508e7b8e  xorgproto-2019.2.tar.bz2
+sha512 cbfdf6bb3d58d4d4e7788c9ed779402352715e9899f65594fbc527b3178f1dc5e03cebc8ba5a863b3c196a1a0f2026c2d0438207ca19f81f3c8b7da0c0667904  xorgproto-2019.2.tar.bz2
 # Locally computed
 sha256 aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
 sha256 dabc025f93129a0eb2d17f37c719dbe5ecbcb5bc8f7bc7f4ce89fe04576cc0c2  COPYING-bigreqsproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 458efbc731..979286b3c1 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2019.1
+XORGPROTO_VERSION = 2019.2
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.20.1
