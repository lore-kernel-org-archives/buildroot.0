From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 08:51:40 +0100
Subject: [Buildroot] [git commit] libvorbis: bump version
Message-ID: <20150303075159.B7CF5817ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9142661f402a22b5c14672e8ca8c254ba8a051f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvorbis/libvorbis.hash |    2 +-
 package/libvorbis/libvorbis.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvorbis/libvorbis.hash b/package/libvorbis/libvorbis.hash
index 3b997ba..e990f4d 100644
--- a/package/libvorbis/libvorbis.hash
+++ b/package/libvorbis/libvorbis.hash
@@ -1,2 +1,2 @@
 # From http://www.xiph.org/downloads/
-sha256 2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372 libvorbis-1.3.4.tar.xz
+sha256 54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1 libvorbis-1.3.5.tar.xz
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 7fd789a..f1b710c 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVORBIS_VERSION = 1.3.4
+LIBVORBIS_VERSION = 1.3.5
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
