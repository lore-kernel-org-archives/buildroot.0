From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 10:26:57 +0100
Subject: [Buildroot] [PATCH] wireless_tools: add license information
Message-ID: <50505561.8040009@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/wireless_tools/wireless_tools.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index d81aa7c..f355689 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -7,6 +7,8 @@
 WIRELESS_TOOLS_VERSION = 29
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
+WIRELESS_TOOLS_LICENSE = GPLv2
+WIRELESS_TOOLS_LICENSE_FILES = COPYING
 WIRELESS_TOOLS_INSTALL_STAGING = YES

 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
-- 
1.7.9.5
