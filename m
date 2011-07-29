From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 08:53:55 +0200
Subject: [Buildroot] [git commit] util-linux: install to staging
Message-ID: <20110729065701.6099A8B55B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6486661a6b41158535d785db9e1e403f7216b5d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For libblkid / libuuid.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c01a4ff..72dabaf 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,6 +8,7 @@ UTIL_LINUX_VERSION_MAJOR = 2.19
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_AUTORECONF = YES
+UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkg-config
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
-- 
1.7.3.4
