From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 20 Aug 2018 19:20:43 -0400
Subject: [Buildroot] [PATCH 1/1] fwup: bump to v1.2.5
Message-ID: <20180820232043.32268-1-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash for the license file.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/fwup/fwup.hash | 3 ++-
 package/fwup/fwup.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 32398bf4d0..73bff448de 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 852e255bd65f9db473a06184abb3e94e3b6b86be7bf66169e8df8146d5966ae1  fwup-v0.15.4.tar.gz
+sha256 20302dc96cef88438034e15551e178bb0652c28d99aa7ca5260100cb3bebbc2a  fwup-v1.2.5.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index c6a18c291c..be0b1d13b8 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUP_VERSION = v0.15.4
+FWUP_VERSION = v1.2.5
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
-- 
2.17.1
