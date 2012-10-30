From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 09:29:44 -0300
Subject: [Buildroot] [PATCHv2 03/12] libnfnetlink: bump to version 1.0.1
In-Reply-To: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351600193-21511-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnfnetlink/libnfnetlink.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 9af28d8..2d79cdb 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNFNETLINK_VERSION = 1.0.0
+LIBNFNETLINK_VERSION = 1.0.1
 LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_INSTALL_STAGING = YES
-- 
1.7.8.6
