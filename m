From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:50:53 +0100
Subject: [Buildroot] [git commit] package/softether: bump version
Message-ID: <20150315135124.31A688077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95c8c928e2d822c155984e84b4c22f2d0388cc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/softether.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index a56f4cc..d73d33c 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 16b713b98da8dba29f0f845d5a8c36d6f7c34824
+SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
