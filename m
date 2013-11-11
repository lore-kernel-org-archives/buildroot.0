From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 15:06:57 +0100
Subject: [Buildroot] [git commit] ethtool: bump version to 3.12.1
Message-ID: <20131111140727.04B019BBCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d93f061eccad3b81a27e8cf02cb8b29e9dba44e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

3.12 release notes:

	* Fix: Remove alternate method to check for VLAN tag offload on Linux
	  < 2.6.37 (-k/-K options)
	* Fix: Hide state of VLAN tag offload and LRO if the kernel is too old
	  for us to reliably detect them (-k option)
	* Feature: Add register dump support for Solarflare SFC9100 family
	  (-d option)

3.12.1 release notes:

This includes a couple of changes that should have gone into 3.12.

	* Fix: Memory corruption when applying external calibration to
	  SFF-8472 module diagnostics (-m option)
	* Feature: Add Intel 82599 and x540 DCB registers to dump
	  (-d option)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 7c22269..32b39e8 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 3.11
+ETHTOOL_VERSION = 3.12.1
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
