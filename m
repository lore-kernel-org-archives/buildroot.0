From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:44:42 +0200
Subject: [Buildroot] [git commit] cryptodev-linux: fix license information
Message-ID: <20140709134616.73A789CF0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e30dc8e75f415c5488de96f11bfdaac0e5b00450
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
