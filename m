From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:22:11 +0200
Subject: [Buildroot] [git commit] package/less: bump to version 590
Message-ID: <20210720174813.7EE0E884B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9e7f0175ed0f20d9ff6d7c38a2f90b11301aa6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index e675569cd8..eed8340ec1 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# http://www.greenwoodsoftware.com/less/less-563.sig
-sha256  ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a  less-563.tar.gz
+# http://www.greenwoodsoftware.com/less/less-590.sig
+sha256  6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10  less-590.tar.gz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index a15bd25bec..7d7a6d5fe5 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 563
+LESS_VERSION = 590
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
