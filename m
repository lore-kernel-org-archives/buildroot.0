From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 19 Aug 2018 16:46:56 +0300
Subject: [Buildroot] [PATCH 1/1] wireless_tools: Fix site URL does not work
Message-ID: <20180819134656.29239-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim.kochan@petcube.com>

Replace broken http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
by https://hewlettpackard.github.io/wireless-tools.

Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
---
 package/wireless_tools/wireless_tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 51320a9b25..b87ab20fb2 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -6,7 +6,7 @@
 
 WIRELESS_TOOLS_VERSION_MAJOR = 30
 WIRELESS_TOOLS_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR).pre9
-WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
+WIRELESS_TOOLS_SITE = https://hewlettpackard.github.io/wireless-tools
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
 WIRELESS_TOOLS_LICENSE = GPL-2.0
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
-- 
2.14.1
