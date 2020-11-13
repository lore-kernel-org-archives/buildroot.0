From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 22:11:07 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/fbtft: add
 license file
Message-ID: <20201113205735.03E558211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac478230c19b2070fc4d5f053b81f6e18618ad98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19275a1a56dbd2cebb9ef91430a0364c0d3a1214)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbtft/fbtft.hash | 1 +
 package/fbtft/fbtft.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/fbtft/fbtft.hash b/package/fbtft/fbtft.hash
index 894d9794a9..5d08d0ef85 100644
--- a/package/fbtft/fbtft.hash
+++ b/package/fbtft/fbtft.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  0e81de89fdd7ab810716fc0549e767527f342e829309dee5c2cca1e9d1728770  fbtft-274035404701245e7491c0c6471c5b72ade4d491.tar.gz
+sha256  a9ca80d65a5ef10fe614a6c1e8c8d4d3b96637e8855a96c7cf0fa438526097a7  fbtft-core.c
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
index b935e741d5..cc11d867fc 100644
--- a/package/fbtft/fbtft.mk
+++ b/package/fbtft/fbtft.mk
@@ -7,5 +7,6 @@
 FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
 FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
 FBTFT_LICENSE = GPL-2.0
+FBTFT_LICENSE_FILES = fbtft-core.c
 
 $(eval $(generic-package))
