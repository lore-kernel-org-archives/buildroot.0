From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:26:59 +0100
Subject: [Buildroot] [git commit] netsniff-ng: bump version to v0.6.0
Message-ID: <20151217163457.96B777FC35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0114e5cb8e59e8133cd64a612120845f21c3a03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 935003c..b4b0500 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f0008edd31df93822b7befe50cfb3740ce6fd35b1013ae3a73b2a389a41022e4 netsniff-ng-v0.5.9.tar.gz
+sha256 a76911f5a8ef0b92c42da568ceebc9e6559c02760f498785e22c8426b623d43f netsniff-ng-v0.6.0.tar.gz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 5774ccd..eecceea 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = v0.5.9
+NETSNIFF_NG_VERSION = v0.6.0
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
