From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:48:36 +0200
Subject: [Buildroot] [git commit branch/next] package/wlroots: bump to
 version 0.11.0
Message-ID: <20200812144301.AF36D85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc9c89612cc1f41f9a64f6e889f8bcd8a871e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 20f7313bba..636f391011 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.10.1/wlroots-0.10.1.tar.gz.sig
-sha256  b84baefbaff7bb04b3d2c43cbacef1a433e2cd65111f8fbf4bfc5faaa4b34b08  wlroots-0.10.1.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.11.0/wlroots-0.11.0.tar.gz.sig
+sha256  a7645e77229aab4942748c621be8bdb8b073d94f35f3e032b867246862bf2d01  wlroots-0.11.0.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 988643485f..7923e94325 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.10.1
+WLROOTS_VERSION = 0.11.0
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
