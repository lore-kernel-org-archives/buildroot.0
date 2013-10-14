From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 16:05:40 +0200
Subject: [Buildroot] [PATCH 3/4] noip: add license information
In-Reply-To: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
References: <1381759541-15243-1-git-send-email-phil@zankapfel.net>
Message-ID: <1381759541-15243-3-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/noip/noip.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.10.4
