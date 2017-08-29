From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:02 +0200
Subject: [Buildroot] [PATCH 3/6] package/iucode-tool: fix upstream source URL
In-Reply-To: <20170829191005.19697-1-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
Message-ID: <20170829191005.19697-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iucode-tool/iucode-tool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index f28698bfd..e8ae36ced 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -6,7 +6,7 @@
 
 IUCODE_TOOL_VERSION = 1.5
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
-IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/latest
+IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
-- 
2.11.0
