From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:38:16 +0100
Subject: [Buildroot] [git commit] package/zmqpp: switch to the official git
Message-ID: <20150315133918.9FD12817AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be389fbe8cae2cee609b6be6a2b599b653ecac6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The git hash 36413487f05b165dfc82ad307a5a1c36a795e607 no
longer refers to any commit id, even in the previous git tree.

By reading the Makefile and CHANGELOG.md the last know
release is 3.2.0.

Switch to the official git tree and use the 3.2.0 release tag.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index fbb0260..7efd04b 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 36413487f05b165dfc82ad307a5a1c36a795e607
-ZMQPP_SITE = $(call github,benjamg,zmqpp,$(ZMQPP_VERSION))
+ZMQPP_VERSION = 3.2.0
+ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = LGPLv3+ with exceptions
