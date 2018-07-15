From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Jul 2018 20:46:42 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: bump version to 12.1
Message-ID: <20180716110216.133F57FA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80db2f4205da12ce31169c24e8f730c36cc29149
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030259.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.hash | 8 ++++----
 package/pulseaudio/pulseaudio.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index f10ed82e90..948f3aa684 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-June/030091.html
-md5 efe7683310080e80bc42707285df8c36  pulseaudio-12.0.tar.xz
-sha1 9b0dcd62ae4c24542e13644e5fac3de5b13d6db7  pulseaudio-12.0.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030259.html
+md5 2511b7ce7193eecf029c91de96eee547  pulseaudio-12.1.tar.xz
+sha1 3d8ecff70b7b47d82fd8a262755ce24dd956bef1  pulseaudio-12.1.tar.xz
 # Locally computed
-sha256 6e422dbdc9fd11c0cb6af869e5eda73dc24a8be3c14725440edd51ce6b464444  pulseaudio/pulseaudio-12.0.tar.xz
+sha256 5f5dfb5e2c376e8c974b80f93b983ed77088ade7fb8b9325a575c45aa35977f3  pulseaudio-12.1.tar.xz
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
 sha256 a1064b9838b6b4feee61eaeb0925da4b4834c984b77716558860c4294ed6c015  LICENSE
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 55f9def639..2b8f5724bc 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 12.0
+PULSEAUDIO_VERSION = 12.1
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
