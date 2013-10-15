From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue, 15 Oct 2013 08:59:34 +0200
Subject: [Buildroot] [PATCH 1/1] nuttcp: add license information
Message-ID: <1381820374-21537-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/nuttcp/nuttcp.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 406219d..8a99ce3 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -7,6 +7,8 @@
 NUTTCP_VERSION = 6.1.2
 NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
+NUTTCP_LICENSE = GPLv2
+NUTTCP_LICENSE_FILES = LICENSE
 
 define NUTTCP_BUILD_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-- 
1.7.10.4
