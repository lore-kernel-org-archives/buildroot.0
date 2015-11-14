From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 09:40:51 +0100
Subject: [Buildroot] [git commit branch/next] fbgrab: bump verstion to 1.3
Message-ID: <20151114084218.C3E8B819FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67a723248f6e4adcf868a1cdeff71640411dd40d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog (see [1] for details):
  - Added support when active framebuffer is not starting at offset 0
  - Fixed broken re-ordering of colors, rgba to argb
  - Fixed broken path for man page

[1] http://fbgrab.monells.se

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/fbgrab.hash |    2 +-
 package/fbgrab/fbgrab.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index 4652f2c..de3bc1f 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	61e0772ad6ea744ee597ae478398ddd0ba6fceee2cf343859bebde2c15bafb91	fbgrab-1.2.tar.gz
+sha256 5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed fbgrab-1.3.tar.gz
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index b60da9a..4455423 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.2
+FBGRAB_VERSION = 1.3
 FBGRAB_SITE = http://fbgrab.monells.se
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPLv2
