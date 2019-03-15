From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xprop: bump version to
 1.2.4
Message-ID: <20190315203120.429C383480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b922c5071ea50620280a3ae1e5d3754a45bfc1f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 10 +++++-----
 package/x11r7/xapp_xprop/xapp_xprop.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index a57d375b84..f513e12c24 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002870.html
-md5 4becb3ddc4674d741487189e4ce3d0b6  xprop-1.2.3.tar.bz2
-sha1 77062c08a23cfca76824b7e8f9860678255d6b1a  xprop-1.2.3.tar.bz2
-sha256 d22afb28c86d85fff10a50156a7d0fa930c80ae865d70b26d805fd28a17a521b  xprop-1.2.3.tar.bz2
-sha512 ad7987fec11ae19b7adc3b0f683fc393e95155f3b6c753d1d8744aedcfb360452eee5735a4c380152b286905931515f3e1a28676b5531001eb8dd93b7249916a  xprop-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002969.html
+md5 cc369c28383a5d7144e7197ee7d30bfa  xprop-1.2.4.tar.bz2
+sha1 0549a927d01930218f1d0089d0157eb9538b34a5  xprop-1.2.4.tar.bz2
+sha256 8c77fb096e46c60032b7e2bde9492c3ffcc18734f50b395085a5f10bfd3cf753  xprop-1.2.4.tar.bz2
+sha512 6e770cb89ba87ae057858cc9f0f5498979e78c3ef66ce86361b7c646cc0b70c41a18d76e55ed7225fe715b22b62bc07c56272519a2631b92832e9403ce260da7  xprop-1.2.4.tar.bz2
 # Locally computed
 sha256 f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415 COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index d8063d94c8..a0ad4302cb 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.3
+XAPP_XPROP_VERSION = 1.2.4
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_LICENSE = MIT
