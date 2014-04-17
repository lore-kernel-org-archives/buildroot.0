From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Apr 2014 10:12:43 -0300
Subject: [Buildroot] [PATCH 1/2] libnftnl: bump to version 1.0.1
Message-ID: <1397740364-8312-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnftnl/libnftnl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 0aecf12..1e054b5 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.0
-LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files/
+LIBNFTNL_VERSION = 1.0.1
+LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
 LIBNFTNL_LICENSE_FILES = COPYING
-- 
1.8.3.2
