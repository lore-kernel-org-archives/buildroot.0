From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:40:58 -0300
Subject: [Buildroot] [PATCH 01/19] boa: define license
Message-ID: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boa/boa.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 9308b54..d6a8e23 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 BOA_VERSION = 0.94.14rc21
-BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
 BOA_SITE = http://www.boa.org/
+BOA_LICENSE = GPLv2+
+BOA_LICENSE_FILES = COPYING
 
 define BOA_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
-- 
1.8.1.5
