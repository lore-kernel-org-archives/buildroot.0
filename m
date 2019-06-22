From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:19:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xorgproto: bump version to
 2019.1
Message-ID: <20190622181943.CED528438B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1d704667fcb6ab913bdb529d1629b2f60d93ab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2019-June/003000.html

Switched _SITE to https.

Removed COPYING-panoramixproto from licenses, it was removed upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xorgproto/xorgproto.hash | 11 +++++------
 package/x11r7/xorgproto/xorgproto.mk   |  5 ++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index c4e7795751..e14a9c0363 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,8 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002841.html
-md5 81557ca47ee66a4e54590fcdadd28114  xorgproto-2018.4.tar.bz2
-sha1 2e4a3db312e1ce81e15515dfcac52ba0aa5a920c  xorgproto-2018.4.tar.bz2
-sha256 fee885e0512899ea5280c593fdb2735beb1693ad170c22ebcc844470eec415a0  xorgproto-2018.4.tar.bz2
-sha512 2db682d10280ca58cdc04d8eb9fef30c111d4cd379de9fec86cff317865b859a576de5426447be9231d24be9762cc1d684c57383a99ad499398e8b7d62b1c03c  xorgproto-2018.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/003000.html
+md5 802ccb9e977ba3cf94ba798ddb2898a4  xorgproto-2019.1.tar.bz2
+sha1 f0001f318dff617912b40a9a8ec182de9ffc47b0  xorgproto-2019.1.tar.bz2
+sha256 a6daaa7a6cbc8e374032d83ff7f47d41be98f1e0f4475d66a4da3aa766a0d49b  xorgproto-2019.1.tar.bz2
+sha512 f26c17f4a027acdc799b532fa65c3ea1b0e8c30794c7b7293060ee9d9dec84b4878966cd2dcda43584849232e73a208abd4213374f89b05c10e5aae92bdc00be  xorgproto-2019.1.tar.bz2
 # Locally computed
 sha256 aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
 sha256 dabc025f93129a0eb2d17f37c719dbe5ecbcb5bc8f7bc7f4ce89fe04576cc0c2  COPYING-bigreqsproto
@@ -19,7 +19,6 @@ sha256 823deb4673d3f26aa8c90e704888299648f00be3262f9363eaeecedcd65b936d  COPYING
 sha256 5e083a2ace0215a6084c877c023a6079952ba803d692488203ba4269196debe3  COPYING-inputproto
 sha256 d397a67d4b28e897bc5fce79b2b917df9905b54f961fc3ad1f49c7fe3803f92c  COPYING-kbproto
 sha256 7a5dd5d4c989c167da50f15879959f42bbda960e06d0a0aea7197f61fe1dc846  COPYING-lg3dproto
-sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING-panoramixproto
 sha256 8442b5f22f2fb13017a4302a906e7dedc899267b41f613558970941120170128  COPYING-pmproto
 sha256 64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING-presentproto
 sha256 6b890b118261694865988378dbba876bcd9caa1a421c5c0d626116948bc0ae35  COPYING-printproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 3f7d25b068..9e8abd4c6a 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2018.4
+XORGPROTO_VERSION = 2019.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
-XORGPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
 XORGPROTO_LICENSE_FILES = \
 	COPYING-applewmproto \
@@ -24,7 +24,6 @@ XORGPROTO_LICENSE_FILES = \
 	COPYING-inputproto \
 	COPYING-kbproto \
 	COPYING-lg3dproto \
-	COPYING-panoramixproto \
 	COPYING-pmproto \
 	COPYING-presentproto \
 	COPYING-printproto \
