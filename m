From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jan 2013 09:18:44 -0300
Subject: [Buildroot] [PATCHv2] arptables: bump to version 0.0.4
Message-ID: <1357993124-13197-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/arptables/arptables.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index dac5ca4..bf68670 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-ARPTABLES_VERSION = 0.0.3
-ARPTABLES_VERSION_MINOR = 4
-ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
+ARPTABLES_VERSION = 0.0.4
+ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
 ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
+ARPTABLES_LICENSE = GPLv2+
 
 define ARPTABLES_BUILD_CMDS
 	$(MAKE) -C $(@D) \
-- 
1.7.12.4
