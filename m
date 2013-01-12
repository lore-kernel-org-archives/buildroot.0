From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jan 2013 08:37:55 -0300
Subject: [Buildroot] [PATCH 2/2] arptables: bump to version 0.0.4
In-Reply-To: <1357990675-12863-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357990675-12863-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357990675-12863-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/arptables/arptables.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index dac5ca4..5a9986b 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-ARPTABLES_VERSION = 0.0.3
-ARPTABLES_VERSION_MINOR = 4
-ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
+ARPTABLES_VERSION = 0.0.4
+ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
 ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
 
 define ARPTABLES_BUILD_CMDS
-- 
1.7.12.4
