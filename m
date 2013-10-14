From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 23:03:10 +0200
Subject: [Buildroot] [git commit] noip: add license information
Message-ID: <20131014210424.562989B9CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b1eba735e03ee6ad2147325f0a73408454d960a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/noip/noip.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index a3d5e3d..04ff5b2 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -7,6 +7,8 @@
 NOIP_VERSION = 2.1.9
 NOIP_SITE = http://www.no-ip.com/client/linux
 NOIP_SOURCE = noip-duc-linux.tar.gz
+NOIP_LICENSE = GPLv2+
+NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
 	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
