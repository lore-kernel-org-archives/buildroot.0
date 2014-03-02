From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Mar 2014 16:20:56 -0300
Subject: [Buildroot] [PATCH] systemd: fix license info
Message-ID: <1393788056-31220-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

File is LICENSE.GPL2, not LICENSE.GPLV2, fixes:
http://autobuild.buildroot.net/results/e6c/e6c4dc22c014e62ce35273945a2a2307315ec3f7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92bdbcc..0fc00e1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -8,7 +8,7 @@ SYSTEMD_VERSION = 207
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = GPLv2+
-SYSTEMD_LICENSE_FILES = LICENSE.GPLV2 LICENSE.LGPL2.1 LICENSE.MIT
+SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 LICENSE.MIT
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
-- 
1.8.3.2
