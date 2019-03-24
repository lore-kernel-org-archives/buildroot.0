From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:06:43 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati: bump
 version to 19.0.1
Message-ID: <20190324220643.A533481827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8aca601a12338b2f52e7b76925e947ada769af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash   | 10 +++++-----
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 4b6cce7af8..34d9ded346 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002967.html
-md5 0a95c1c8158d658bd0b3ac38a1b31382  xf86-video-ati-19.0.0.tar.bz2
-sha1 c7bb5d25ca725b8fa625a5f1a6948433e51b98a5  xf86-video-ati-19.0.0.tar.bz2
-sha256 dd907d318884bb6e81e7e62da7bb34af26aeeed3a81c21e0b46a4f3cae3ff457  xf86-video-ati-19.0.0.tar.bz2
-sha512 0674c8befa926fd3b431ce80d90f2cd0de17314efe7fd3a5ed0d78018d6cd32625b514bf68436a47eb15e5ad4b50317f3c09fd687b77e69a067d1210ee459827  xf86-video-ati-19.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002986.html
+md5 47eccf71823206ade9629cba69de7ef6  xf86-video-ati-19.0.1.tar.bz2
+sha1 e8899c2d237381d9278429a1427e02fcba1d5174  xf86-video-ati-19.0.1.tar.bz2
+sha256 5cb6015d8664546ad1311bc9c363d7bc41ebf60e7046ceb44dd38e5b707961b0  xf86-video-ati-19.0.1.tar.bz2
+sha512 e04c5395e3a49d81b8f7a4b0e11fe8c9ebd17af056a4eab4541873796dce05b103c93fb185f3a00873010df0655cd7311e6d27e177aeb7345c4c8017bbd1eb17  xf86-video-ati-19.0.1.tar.bz2
 # Locally computed
 sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 45401b7841..c9344f8596 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 19.0.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 19.0.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
