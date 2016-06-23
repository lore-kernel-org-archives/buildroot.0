From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:07:49 +0200
Subject: [Buildroot] [git commit] pulseaudio: bump version to 9.0
Message-ID: <20160623191635.8CA09802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14e657206f9afc5bafbe272bdb893962ef1efa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.hash | 6 +++---
 package/pulseaudio/pulseaudio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 0d1a3d2..0ef825d 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,3 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-8.0.tar.xz.{md5,sha1}
-md5 8678442ba0bb4b4c33ac6f62542962df  pulseaudio-8.0.tar.xz
-sha1 1399a2f6288ad743184b6c2192129fef033343ac  pulseaudio-8.0.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-9.0.tar.xz.{md5,sha1}
+md5 da7162541b3a9bc20576dbd0d7d1489a  pulseaudio-9.0.tar.xz
+sha1 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064  pulseaudio-9.0.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 06b0b84..024b168 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 8.0
+PULSEAUDIO_VERSION = 9.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
