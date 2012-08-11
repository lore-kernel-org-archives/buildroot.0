From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:27 -0300
Subject: [Buildroot] [PATCH 2/8] conntrack-tools: bump to version 1.2.2
In-Reply-To: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344724053-10165-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/conntrack-tools/conntrack-tools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 8f1159b..6f438fc 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-CONNTRACK_TOOLS_VERSION = 1.2.1
+CONNTRACK_TOOLS_VERSION = 1.2.2
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config \
 	libnetfilter_conntrack libnetfilter_cttimeout
+CONNTRACK_TOOLS_LICENSE = GPLv2
+CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
