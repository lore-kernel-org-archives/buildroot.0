From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:13:42 +0100
Subject: [Buildroot] [git commit branch/next] package/fbgrab: bump to
 version 1.4
Message-ID: <20201109200030.58A04821D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbab0c22d9c367de8425e6c0ae5bdb900e30a681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for line length deviating from width

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/fbgrab.hash | 2 +-
 package/fbgrab/fbgrab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index 414a93c99e..4d9a6b97d4 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2bfdad379579c4ca1a910d0a8ac63183ef2c12a45e6b7d402fd045d83bb3faee  fbgrab-1.3.3.tar.gz
+sha256  62d7aa82138ac36db0921832f3b5267b4cffc0dc22c8701857ebcb997960a32e  fbgrab-1.4.tar.gz
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 6d2f09bc21..1ae03ae43f 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.3.3
+FBGRAB_VERSION = 1.4
 FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPL-2.0
