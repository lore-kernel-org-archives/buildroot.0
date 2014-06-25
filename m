From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:04:35 +0200
Subject: [Buildroot] [git commit] netplug: add license information
Message-ID: <20140625211214.2883E9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3a22cdf1930ccb8629c7a0360646b3a0b175981
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netplug/netplug.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 5756281..0bd7c78 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -7,6 +7,8 @@
 NETPLUG_VERSION = 1.2.9.2
 NETPLUG_SOURCE = netplug-$(NETPLUG_VERSION).tar.bz2
 NETPLUG_SITE = http://www.red-bean.com/~bos/netplug
+NETPLUG_LICENSE = GPLv2
+NETPLUG_LICENSE_FILES = COPYING
 
 define NETPLUG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
