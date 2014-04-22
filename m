From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:29:41 +0200
Subject: [Buildroot] [git commit] smack: fix _VERSION and _SITE variable
Message-ID: <20140422212946.137709C988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=938f7a4f740b1704228b6a3487097f463d904a30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smack/smack.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 2858686..af6e81c 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SMACK_VERSION = 1.0.4
-SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
+SMACK_VERSION = v1.0.4
+SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
 SMACK_LICENSE = LGPLv2.1
 SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
