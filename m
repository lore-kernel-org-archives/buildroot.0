From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Mar 2013 09:17:54 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.8.6
Message-ID: <1362745074-7281-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-2475, CVE-2013-2476, CVE-2013-2477, CVE-2013-2478,
CVE-2013-2479, CVE-2013-2480, CVE-2013-2481, CVE-2013-2482,
CVE-2013-2483, CVE-2013-2484, CVE-2013-2485, CVE-2013-2486,
CVE-2013-2487, and CVE-2013-2488.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c9fb44b..5a4d8b5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WIRESHARK_VERSION = 1.8.5
+WIRESHARK_VERSION = 1.8.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.1.5
