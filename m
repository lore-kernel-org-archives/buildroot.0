From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] mpc: fix download URL
Message-ID: <20101104230331.370EC8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1310bad0aee3254266976cc68c70032da5405a34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpc/mpc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 9fd2ba7..561d25a 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -7,7 +7,7 @@
 #############################################################
 MPC_VERSION:=0.8.2
 MPC_SOURCE:=mpc-$(MPC_VERSION).tar.gz
-MPC_SITE:=http://www.multiprecision.org/mpc/download/$(MPC_SOURCE)
+MPC_SITE:=http://www.multiprecision.org/mpc/download
 MPC_CAT:=$(ZCAT)
 MPC_DIR:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)
 MPC_TARGET_DIR:=$(BUILD_DIR)/mpc-$(MPC_VERSION)
-- 
1.7.1
