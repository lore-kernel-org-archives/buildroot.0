From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 29 Jan 2016 08:52:42 +0100
Subject: [Buildroot] [PATCH 1/2] armadillo: drop useless
	ARMADILLO_VERSION_MAJOR variable
Message-ID: <1454053963-1805-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

~/buildroot$ grep -R ARMADILLO_VERSION_MAJOR .
./package/armadillo/armadillo.mk:ARMADILLO_VERSION_MAJOR = 5.100
./package/armadillo/armadillo.mk:ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).2

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/armadillo/armadillo.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 607103c..8341ff6 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION_MAJOR = 5.100
-ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).2
+ARMADILLO_VERSION = 5.100.2
 ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
-- 
1.9.1
