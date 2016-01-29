From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2016 17:51:07 +0100
Subject: [Buildroot] [git commit] armadillo: drop useless
	ARMADILLO_VERSION_MAJOR variable
Message-ID: <20160201224700.643607FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42eeda340abf27cd22d22d36504fd5c25fc58a8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

~/buildroot$ grep -R ARMADILLO_VERSION_MAJOR .
./package/armadillo/armadillo.mk:ARMADILLO_VERSION_MAJOR = 5.100
./package/armadillo/armadillo.mk:ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).2

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
