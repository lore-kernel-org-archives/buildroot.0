From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 09:49:53 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: bump version to 14.1
Message-ID: <20210117083229.2FD6E87590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed6dd10f6bce1e4b1240174f9f7cec04d811d0fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031986.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseaudio/pulseaudio.hash | 4 ++--
 package/pulseaudio/pulseaudio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 72f4ca5b06..5989f8e920 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2020-November/031938.html
-sha256  a834775d9382b055504e5ee7625dc50768daac29329531deb6597bf05e06c261  pulseaudio-14.0.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031986.html
+sha256  b0bcca2a45e4fe1f73c7709dcf75a17dd5235688d5d150069e765dda4884b837  pulseaudio-14.1.tar.xz
 # Locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 52a849aa64..472a1d3943 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 14.0
+PULSEAUDIO_VERSION = 14.1
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
