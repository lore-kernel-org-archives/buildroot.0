From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:23:00 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.2
Message-ID: <20151009132303.82A5681F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=955a92fb0f435a15977d2121ff0d15f14ed288e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ethtool/ethtool.hash |    2 +-
 package/ethtool/ethtool.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 5fde687..53f31d0 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	904887acc7d2f9c35dec04eb0e8a727a3205f346af4f4c95560ea3798de5ecff	ethtool-4.0.tar.xz
+sha256	8cb854bcf71ef8b484b5d2a0e6bf056ae1fbf12cfb19e4907b74b7b21da91e87	ethtool-4.2.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c358c62..c56eeb9 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.0
+ETHTOOL_VERSION = 4.2
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
