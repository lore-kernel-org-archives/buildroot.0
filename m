From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Aug 2013 18:57:18 -0300
Subject: [Buildroot] [PATCH 2/5] conntrack-tools: bump to version 1.4.2
In-Reply-To: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
References: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1377899841-26206-2-git-send-email-gustavo@zacarias.com.ar>
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
index 614bbd1..eb7654e 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.1
+CONNTRACK_TOOLS_VERSION = 1.4.2
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
-- 
1.8.1.5
