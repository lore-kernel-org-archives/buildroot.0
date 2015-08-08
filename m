From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:26 -0000
Subject: [Buildroot] [git commit branch/next] lbreakout2: add
	LBREAKOUT2_VERSION_MAJOR variable
Message-ID: <20150808105606.205A17FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cee449a1ce14b587a397707cac3a4835a8e5ceca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lbreakout2/lbreakout2.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index d72b949..5dc4c71 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/2.6
-LBREAKOUT2_VERSION = 2.6.4
+LBREAKOUT2_VERSION_MAJOR = 2.6
+LBREAKOUT2_VERSION = $(LBREAKOUT2_VERSION_MAJOR).4
+LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT2_VERSION_MAJOR)
 LBREAKOUT2_LICENSE = GPLv2+
 LBREAKOUT2_LICENSE_FILES = COPYING
 
