From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:40:59 -0300
Subject: [Buildroot] [PATCH 02/19] bridge-utils: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bridge-utils/bridge-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index b1744a4..6c1975f 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -9,6 +9,8 @@ BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.gz
 BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
+BRIDGE_UTILS_LICENSE = GPLv2+
+BRIDGE_UTILS_LICENSE_FILES = COPYING
 
 define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
-- 
1.8.1.5
