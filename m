From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 May 2012 11:50:03 -0300
Subject: [Buildroot] [PATCH 1/4] libmnl: bump to version 1.0.3
Message-ID: <1338216606-21082-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmnl/libmnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 407ca52..52719cd 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMNL_VERSION = 1.0.2
+LIBMNL_VERSION = 1.0.3
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
-- 
1.7.3.4
