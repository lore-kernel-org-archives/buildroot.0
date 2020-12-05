From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:23:08 +0100
Subject: [Buildroot] [git commit] package/less: bump version to 563
Message-ID: <20201205201041.7044A81944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=099091be8e3b51bf2db35d9c1cca7a1708623b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/less/less.hash | 6 +++---
 package/less/less.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 57a857efe4..e675569cd8 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# http://www.greenwoodsoftware.com/less/less-551.sig
-sha256 ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d less-551.tar.gz
+# http://www.greenwoodsoftware.com/less/less-563.sig
+sha256  ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a  less-563.tar.gz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 3e58d39ca5..89962f9529 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 551
+LESS_VERSION = 563
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
