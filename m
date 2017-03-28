From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:49:12 +0200
Subject: [Buildroot] [git commit] powerpc-utils: Bump to v1.3.3
Message-ID: <20170328194923.F3BFC81744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31eaf300a16b6924327a11ab3c402e08976929f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In particular this includes commit d63e12a "nvram:read list of partion
names dynamically" which fixes an issue preventing the nvram tool from
writing to certain partitions.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 9e299da..fe5cc6a 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 657790a4aea7f3e4649a454b4c384e255145bff9b9c5e40402170603980a6736 powerpc-utils-v1.3.1.tar.gz
+sha256 2a3f4e7ef219d4de642c7da100d7d6511e93556778c0814b2ebc1170256fc844 powerpc-utils-v1.3.3.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 036be52..f6e0277 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.3.1
+POWERPC_UTILS_VERSION = v1.3.3
 POWERPC_UTILS_SITE = $(call github,nfont,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
