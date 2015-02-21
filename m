From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 10:11:43 +0100
Subject: [Buildroot] [git commit branch/next] mpc: bump to version 1.0.3
Message-ID: <20150221091149.E7627803E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af7d74a9b10991f05cc7e90907c991af11855d22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpc/mpc.hash |    2 +-
 package/mpc/mpc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index bee59fe..98f1447 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,2 +1,2 @@
 # From http://www.multiprecision.org/index.php?prog=mpc&page=download
-sha1	5072d82ab50ec36cc8c0e320b5c377adb48abe70	mpc-1.0.2.tar.gz
+sha1	b8be66396c726fdc36ebb0f692ed8a8cca3bcc66	mpc-1.0.3.tar.gz
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 81ee5f0..bc26599 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.0.2
+MPC_VERSION = 1.0.3
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
