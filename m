From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Aug 2013 18:57:17 -0300
Subject: [Buildroot] [PATCH 1/5] libnetfilter_conntrack: bump to version
	1.0.4
Message-ID: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_conntrack/libnetfilter-conntrack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 41b0640..1db30a1 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.3
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.4
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-- 
1.8.1.5
