From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Dec 2020 08:56:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 14.0
Message-ID: <20201205075653.2217249-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes, switched _SITE to https.

Release notes:
https://lists.freedesktop.org/archives/pulseaudio-discuss/2020-November/031938.html
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/14.0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pulseaudio/pulseaudio.hash | 10 +++++-----
 package/pulseaudio/pulseaudio.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 11d9a275c8..72f4ca5b06 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2019-September/031373.html
-sha256 961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057  pulseaudio-13.0.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2020-November/031938.html
+sha256  a834775d9382b055504e5ee7625dc50768daac29329531deb6597bf05e06c261  pulseaudio-14.0.tar.xz
 # Locally computed
-sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
-sha256 a1064b9838b6b4feee61eaeb0925da4b4834c984b77716558860c4294ed6c015  LICENSE
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
+sha256  a1064b9838b6b4feee61eaeb0925da4b4834c984b77716558860c4294ed6c015  LICENSE
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index e64aa6f97b..52a849aa64 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 13.0
+PULSEAUDIO_VERSION = 14.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
-PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
+PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
-- 
2.29.2
