From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Dec 2011 22:59:24 +0100
Subject: [Buildroot] [git commit] ethtool: bump to version 3.1
Message-ID: <20111221220349.DB7828FAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d134ce8b56175b84614bda58191075c3582ce6cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index a42169c..04f7dac 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.0
-ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
+ETHTOOL_VERSION = 3.1
+ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
 $(eval $(call AUTOTARGETS))
