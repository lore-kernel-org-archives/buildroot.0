From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:42:23 +0200
Subject: [Buildroot] [git commit] udpcast: add license information
Message-ID: <20140701224922.827EF9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e717b104f28950a83cbd35d38c5611a5fc1de6b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: GPL license is v2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udpcast/udpcast.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 786a88e..b0ce643 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -7,6 +7,8 @@
 UDPCAST_VERSION = 20120424
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
+UDPCAST_LICENSE = BSD-2c, GPLv2+
+UDPCAST_LICENSE_FILES = COPYING
 
 define UDPCAST_REMOVE_UDP_SENDER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
