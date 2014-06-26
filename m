From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:38 -0300
Subject: [Buildroot] [PATCH 10/53] ezxml: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ezxml/ezxml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 139bf64..7693466 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -7,6 +7,8 @@
 EZXML_VERSION = 0.8.6
 EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
 EZXML_INSTALL_STAGING = YES
+EZXML_LICENSE = MIT
+EZXML_LICENSE_FILES = license.txt
 
 define EZXML_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
-- 
1.8.5.5
