From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:44:40 +0200
Subject: [Buildroot] [git commit] libvpx: bump to version 1.3.0
Message-ID: <20141001174616.572429D7EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd8f2f929c5bd7671a86e4bd3b8caf6c77cffce5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvpx/libvpx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 480f1c4..c288010 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = v1.2.0
+LIBVPX_VERSION = v1.3.0
 LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
 LIBVPX_SITE_METHOD = git
 
