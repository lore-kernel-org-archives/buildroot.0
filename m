From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Mar 2015 18:01:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/zmqpp: switch to the official git
Message-ID: <1426352489-19916-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git hash 36413487f05b165dfc82ad307a5a1c36a795e607 no
longer refers to any commit id, even in the previous git tree.

By reading the Makefile and CHANGELOG.md the last know
release is 3.2.0.

Switch to the official git tree and use the 3.2.0 release tag.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/zmqpp/zmqpp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.3
