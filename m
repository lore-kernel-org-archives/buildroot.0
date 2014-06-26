From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:30 -0300
Subject: [Buildroot] [PATCH 02/53] bonnie: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bonnie/bonnie.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 9c576b6..b584b2a 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -7,6 +7,8 @@
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
 BONNIE_SITE = http://www.coker.com.au/bonnie++/
+BONNIE_LICENSE = GPLv2
+BONNIE_LICENSE_FILES = copyright.txt
 
 define BONNIE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
-- 
1.8.5.5
