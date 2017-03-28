From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 28 Mar 2017 16:37:02 +1100
Subject: [Buildroot] [PATCH] powerpc-utils: Bump to v1.3.3
Message-ID: <20170328053702.27113-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular this includes commit d63e12a "nvram:read list of partion
names dynamically" which fixes an issue preventing the nvram tool from
writing to certain partitions.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 9e299da38..fe5cc6a24 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 657790a4aea7f3e4649a454b4c384e255145bff9b9c5e40402170603980a6736 powerpc-utils-v1.3.1.tar.gz
+sha256 2a3f4e7ef219d4de642c7da100d7d6511e93556778c0814b2ebc1170256fc844 powerpc-utils-v1.3.3.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 036be52dc..f6e02778d 100644
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
-- 
2.12.0
