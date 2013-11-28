From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 09:57:16 -0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.5.1
Message-ID: <1385643437-8189-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpcap/libpcap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index ec4d346..aba2510 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.4.0
+LIBPCAP_VERSION = 1.5.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
1.8.3.2
