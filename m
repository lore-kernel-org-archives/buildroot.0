From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:59 -0300
Subject: [Buildroot] [PATCH 10/10] wipe: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wipe/wipe.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index e523a31..eed90be 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -8,6 +8,8 @@ WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
 WIPE_AUTORECONF = YES
+WIPE_LICENSE = GPLv2+
+WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
-- 
1.7.12.4
