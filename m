From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Dec 2013 19:04:27 -0300
Subject: [Buildroot] [PATCH 1/2] wireshark: security bump to version 1.10.4
Message-ID: <1387490668-6554-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-7112, CVE-2013-7113 and CVE-2013-7114.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ecd414f..54bd5ec 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.10.3
+WIRESHARK_VERSION = 1.10.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.3.2
