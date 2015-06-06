From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat,  6 Jun 2015 09:15:20 +0200
Subject: [Buildroot] [PATCH 2/3] lbreakout2: add LBREAKOUT2_VERSION_MAJOR
	variable
In-Reply-To: <1433574921-30965-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433574921-30965-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1433574921-30965-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lbreakout2/lbreakout2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
 
-- 
1.9.1
