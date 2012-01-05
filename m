From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:14 -0300
Subject: [Buildroot] [PATCH 01/10] libmnl: bump to version 1.0.2
Message-ID: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
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
index 6871034..407ca52 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMNL_VERSION = 1.0.1
+LIBMNL_VERSION = 1.0.2
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
-- 
1.7.3.4
