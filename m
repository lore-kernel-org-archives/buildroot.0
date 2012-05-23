From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:33 -0300
Subject: [Buildroot] [PATCH 1/7] libnetfilter-conntrack: bump to version
	1.0.1
Message-ID: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../libnetfilter-conntrack.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 66f0f69..3313e23 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.0
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.1
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-- 
1.7.3.4
