From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:52:19 +0200
Subject: [Buildroot] [git commit] lbreakout2: add LBREAKOUT2_VERSION_MAJOR
	variable
Message-ID: <20150609205248.4B9A681D83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cee449a1ce14b587a397707cac3a4835a8e5ceca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
