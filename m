From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:50:39 -0300
Subject: [Buildroot] [PATCH 5/6] conntrack-tools: bump to version 1.4.1
In-Reply-To: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362415840-9634-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/conntrack-tools/conntrack-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index ece3090..a961c6f 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.0
+CONNTRACK_TOOLS_VERSION = 1.4.1
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
-- 
1.7.12.4
