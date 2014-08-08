From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Aug 2014 10:29:54 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.10.9
Message-ID: <1407504594-3772-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
WNPA-SEC-2014-08 / CVE-2014-5161 / CVE-2014-5162
The Catapult DCT2000 and IrDA dissectors could underrun a buffer.

WNPA-SEC-2014-09 / CVE-2014-5163
The GSM Management dissector could crash.

WNPA-SEC-2014-10 / CVE-2014-5164
The RLC dissector could crash.

WNPA-SEC-2014-11 / CVE-2014-5165
The ASN.1 BER dissector could crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 4117d19..da76e37 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.10.8
+WIRESHARK_VERSION = 1.10.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.5.5
