From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 Dec 2011 08:45:18 -0300
Subject: [Buildroot] [PATCH] ebtables: bump to version 2.0.10-3
Message-ID: <1322999118-3192-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ebtables/ebtables.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 6cfdfdc..b29c462 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -3,7 +3,8 @@
 # ebtables
 #
 #############################################################
-EBTABLES_VERSION = 2.0.10-1
+
+EBTABLES_VERSION = 2.0.10-3
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
 
-- 
1.7.3.4
