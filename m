From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:57:40 +0200
Subject: [Buildroot] [git commit] package/x11r7/xorgproto: bump version to
 2021.3
Message-ID: <20210328203259.D090088529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fc285259b9bfd6ae2e0b4924cc77ec8cfcb7c64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-February/003072.html
https://lists.x.org/archives/xorg-announce/2021-February/003073.html

Update license hash after upstream typo fix:
https://cgit.freedesktop.org/xorg/proto/xorgproto/commit/COPYING-x11proto?id=09602b2130b3710bcca4d2707132bd47d4a832ef

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xorgproto/xorgproto.hash | 11 +++++------
 package/x11r7/xorgproto/xorgproto.mk   |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index fda42ac8f6..3a1197027a 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,8 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2020-April/003042.html
-md5 c29f4fa78f53b52b3efdc71ebd9506b6  xorgproto-2020.1.tar.bz2
-sha1 1cdab4e9ab796760ddb9582071328469a8eca08a  xorgproto-2020.1.tar.bz2
-sha256 54a153f139035a376c075845dd058049177212da94d7a9707cf9468367b699d2  xorgproto-2020.1.tar.bz2
-sha512 2d10533e54987f293e1c8578aa742c38cf2fac8551db1d317cf5ee4a6a9600eced50f59c57c38b35dd210fe02d350294c967512f04cb9876d6c0c1f7e89cb199  xorgproto-2020.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-February/003073.html
+sha256  4c732b14fc7c7db64306374d9e8386d6172edbb93f587614df1938b9d9b9d737  xorgproto-2021.3.tar.bz2
+sha512  3965e8f7f9fbfb2ad8c315865e112e2743915e6b9669fb1ee9bdd376fe4dce0145d547c679a321763b3eaa54832c7a92ff627f36505e914d2a4c48c2246a800e  xorgproto-2021.3.tar.bz2
+
 # Locally computed
 sha256 aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
 sha256 dabc025f93129a0eb2d17f37c719dbe5ecbcb5bc8f7bc7f4ce89fe04576cc0c2  COPYING-bigreqsproto
@@ -30,7 +29,7 @@ sha256 fcbd3c628bf4d28ee3e6032054bf44bbe58f3b1a944dad856a8d3eb6b37ea412  COPYING
 sha256 d6d3513f5a7099748dc387f54498d799380b45f8a444f13aa98aa45a860ae55b  COPYING-trapproto
 sha256 f8f49bbad61967ebc890fb79fff5bfb7cfc1c341aa8f8dee13eb3fb534040b47  COPYING-videoproto
 sha256 eb183a00c61bb47992f096b6993ed7ec17518bea9c285fe87efff7f622cc6c12  COPYING-windowswmproto
-sha256 da4a28570230228b9bd80a701c5d8752f8609394de2e0d46d26d978bd07610db  COPYING-x11proto
+sha256 3bd8e0c41497bfe6ab8d11c3c90c5e79edd0b2437f2bf81161575f54bae53f21  COPYING-x11proto
 sha256 5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING-xcmiscproto
 sha256 fb42146c6c06a200a9b121220eb692ff9101ba0fbd0b224b9e16a016c59ae86a  COPYING-xextproto
 sha256 3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYING-xf86bigfontproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 1c9f320e51..7e157103a4 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2020.1
+XORGPROTO_VERSION = 2021.3
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
