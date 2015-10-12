From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 22:36:49 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version to 1.6.0
Message-ID: <20151012203844.6ACA381DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2d7106218f40dc4ece618477b9e16abb06eaad2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash |    4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 6ef2fff..58c8556 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
-sha256	40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae  gstreamer-1.4.5.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.6.0.tar.xz.sha256sum
+sha256	52ef885647afef11c8b7645a9afefe04aa09e8971c4b932e7717872ab8a30fcc  gstreamer-1.6.0.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 7840284..6531ca7 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.4.5
+GSTREAMER1_VERSION = 1.6.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
