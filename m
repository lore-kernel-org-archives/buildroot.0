From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 13:12:57 +0100
Subject: [Buildroot] [git commit] ethtool: bump to version 4.5
Message-ID: <20160314121342.F0EBA807F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c488de72890b87cc0bcc28f41f6bbedaa610950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 53f31d0..04022a5 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	8cb854bcf71ef8b484b5d2a0e6bf056ae1fbf12cfb19e4907b74b7b21da91e87	ethtool-4.2.tar.xz
+sha256	bb2834332c5ac7f5bbe1c9f78f4fa851e4a3fe6397b124d58467c9ccee9fca3b	ethtool-4.5.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c56eeb9..f6f4263 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.2
+ETHTOOL_VERSION = 4.5
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
