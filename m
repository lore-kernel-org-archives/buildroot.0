From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 17:00:39 -0300
Subject: [Buildroot] [PATCH 4/4] cryptodev-linux: fix license information
In-Reply-To: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404417639-5879-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptodev-linux/cryptodev-linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 7ec327e..03e3126 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -8,8 +8,8 @@ CRYPTODEV_LINUX_VERSION = 1.6
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
 CRYPTODEV_LINUX_DEPENDENCIES = linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
-CRYPTODEV_LICENSE = GPLv2+
-CRYPTODEV_LICENSE_FILES = COPYING
+CRYPTODEV_LINUX_LICENSE = GPLv2+
+CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
 define CRYPTODEV_LINUX_BUILD_CMDS
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
-- 
1.8.5.5
