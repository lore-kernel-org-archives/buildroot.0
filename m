From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 19:48:38 +0100
Subject: [Buildroot] [git commit] package/rrdtool: bump version from 1.6.0
 to 1.7.0
Message-ID: <20190204185126.6C9708368A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2dd1bf25d07aeef776e10c304c6dfdce7d2e453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the releases at https://github.com/oetiker/rrdtool-1.x/releases
which mentions this is not a user facing release but attempts to
be more robust against odd input.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rrdtool/rrdtool.hash | 6 ++++--
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index cff5501de9..6640673440 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,2 +1,4 @@
-# Locally calculated
-sha256	cd948e89cd2d8825fab4a6fb0323f810948d934af7d92c9ee8b5e9e1350e52d7	rrdtool-1.6.0.tar.gz
+# Locally calculated sha256
+sha256	f97d348935b91780f2cd80399719e20c0b91f0a23537c0a85f9ff306d4c5526b	rrdtool-1.7.0.tar.gz
+sha256	884385795ee48cd820082e8823bc748cd20574112da2cc7d2ef505b47b1058c3	COPYRIGHT
+sha256	14079d501f3092405a192463603f66e13da88fc5894981e2962e2e6aec4ab178	LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index ea5c892e4a..144bbcfb18 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.6.0
+RRDTOOL_VERSION = 1.7.0
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
