From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 23:36:55 +0100
Subject: [Buildroot] [git commit] mpc: bump to version 1.0.2
Message-ID: <20140116223751.D672B9C43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ed7b6c34a4971c84be43a9694439cd2c988b168
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpc/mpc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 1023665..81ee5f0 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.0.1
+MPC_VERSION = 1.0.2
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
