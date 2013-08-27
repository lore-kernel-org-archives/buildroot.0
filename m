From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:34:12 +0200
Subject: [Buildroot] [git commit] linux-fusion: bump version to 9.0.2
Message-ID: <20130827210259.CA3B79B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=282456212f2b3d232653844eebdd7c6e3be27506
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with recent kernels.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index ff31934..6f3d50a 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FUSION_VERSION = 9.0.0
+LINUX_FUSION_VERSION = 9.0.2
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
