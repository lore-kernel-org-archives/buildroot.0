From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 13:42:28 +0200
Subject: [Buildroot] [git commit] screen: bump version to 4.4.0
Message-ID: <20160620114257.20F2A80365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67645930789d25b89d7c2a2c5caada95f3ed35fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screen/screen.hash | 2 +-
 package/screen/screen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 10ba214..ee5105a 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63	screen-4.3.1.tar.gz
+sha256 ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b  screen-4.4.0.tar.gz
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 0316e3d..84c3d75 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.3.1
+SCREEN_VERSION = 4.4.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
