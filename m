From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Nov 2017 23:38:03 +0100
Subject: [Buildroot] [git commit] ethtool: Bump to version 4.13
Message-ID: <20171104223155.B003281137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89d525186161d4651366379ac21e80eead6a754e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 77fb600..39e10ff 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	12d8edaa8064966b8ef19cc44fecc096a68828035b6a1f2c67a27531a718e1b2	ethtool-4.11.tar.xz
+sha256	b7c1a380007d30eaf261a63b3cfc000f9d93f9eb7626dcd48b5d2a733af99cba	ethtool-4.13.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 225eedd..991df49 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.11
+ETHTOOL_VERSION = 4.13
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
