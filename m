From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:26:37 +0100
Subject: [Buildroot] [git commit] dhcpdump: add licensing info
Message-ID: <20131211213615.9A1619BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05cae783d798a4ec3eb2023f180aadd3251fddb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpdump/dhcpdump.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 1f1737d..cb2daa9 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,9 +5,10 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE    = http://www.mavetju.org/download/
-
+DHCPDUMP_SITE  = http://www.mavetju.org/download/
 DHCPDUMP_DEPENDENCIES = libpcap
+DHCPDUMP_LICENSE = BSD-2c
+DHCPDUMP_LICENSE_FILES = LICENSE
 
 define DHCPDUMP_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
