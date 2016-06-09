From: Gary Partis <gary@partis.co.uk>
Date: Thu, 9 Jun 2016 15:54:33 +0100
Subject: [Buildroot] [PATCH 1/1] wireless_tools: Ensure ifrename is built
	and installed
Message-ID: <BE7DD8D2CBE7B241971A69A3E62C11B7011890FE@partis.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Partis <gary@partis.co.uk>
---
 package/wireless_tools/wireless_tools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk
b/package/wireless_tools/wireless_tools.mk
index 5fb8f12..12e1c1f 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -12,8 +12,8 @@ WIRELESS_TOOLS_LICENSE = GPLv2
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
-WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
-WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
+WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall all
+WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall install
 
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
-- 
1.7.1
