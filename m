From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 09:00:12 -0300
Subject: [Buildroot] [PATCH] wireshark: bump to version 1.10.5
Message-ID: <1388059212-18141-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a couple of runtime regressions from the 1.10.4 security release.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 54bd5ec..1944b08 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.10.4
+WIRESHARK_VERSION = 1.10.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.3.2
