From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:19:02 +0200
Subject: [Buildroot] [git commit] bridge-utils: define license
Message-ID: <20130628195140.7A8129B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=046c6209b03412972f6184c14098e4ece4bd0a2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bridge-utils/bridge-utils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
